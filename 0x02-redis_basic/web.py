#!/usr/bin/env python3
"""Module with tools for request caching and tracking."""
import redis
import requests
from functools import wraps
from typing import Callable

redis_client = redis.Redis()
"""The module-level Redis instance."""


def data_cacher(method: Callable) -> Callable:
    """Caches the output of fetched data."""
    @wraps(method)
    def wrapper(url: str) -> str:
        """Wrapper function for caching."""
        redis_client.incr(f'count:{url}')
        result = redis_client.get(f'result:{url}')
        if result:
            return result.decode('utf-8')
        result = method(url)
        redis_client.set(f'result:{url}', result, ex=10)  # Using 'ex' parameter for expiration time
        return result
    return wrapper


@data_cacher
def get_page(url: str) -> str:
    """Returns the content of a URL after caching the request's response,
    and tracking the request.
    """
    response = requests.get(url)
    return response.text
