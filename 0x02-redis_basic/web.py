#!/usr/bin/env python3
"""module with tools for request caching and tracking.
"""
import redis
import requests
from functools import wraps
from typing import Callable


redis_client = redis.Redis()
"""The module-level Redis instance.
"""


def data_cacher(method: Callable) -> Callable:
    """Caches the output of fetched data.
    """
    @wraps(method)
    def invoker(url: str) -> str:
        """wrapper function for cache.
        """
        redis_client.incr(f'count:{url}')
        result = redis_client.get(f'result:{url}')
        if result:
            return result.decode('utf-8')
        result = method(url)
        redis_client.set(f'count:{url}', 0)
        redis_client.setex(f'result:{url}', 10, result)
        return result
    return invoker


@data_cacher
def get_page(url: str) -> str:
    """Returns the content of a URL after caching the request's response,
    and tracking the request.
    """
    cached_content = redis_client.get(url)
    if cached_content:
        return cached_content.decode('utf-8')
