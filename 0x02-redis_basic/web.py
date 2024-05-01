#!/usr/bin/env python3
"""module with tools for request caching and tracking.
"""
import redis
import requests
from functools import wraps
from typing import Callable


store = redis.Redis()
""" module-level Redis instance.
"""


def data_cacher(method: Callable) -> Callable:
    """Caches the output of fetched data.
    """
    @wraps(method)
    def invoker(url) -> str:
        """wrapper function for cache.
        """
        store.incr(f'count:{url}')
        result = store.get(f'result:{url}')
        if result:
            return result.decode('utf-8')
        result = method(url)
        store.set(f'count:{url}', 0)
        store.setex(f'result:{url}', 10, result)
        return result
    return invoker


@data_cacher
def get_page(url: str) -> str:
    """Returns the content of a URL after caching the request's response,
    and tracking the request.
    """
    return requests.get(url).text