#!/usr/bin/env python3
""" redis  """
import redis
import uuid
from typing import Union
from typing import Callable


class Cache():
    """ init method   """
    def __init__(self) -> None:
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data:  Union[str, bytes, int, float]) -> str:
        """ store method """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(
            self,
            key: str, fn: Callable = None) -> Union[str, bytes, int, float]:
        """ Retrieves a value from Redis storage based on a given key
        """
        data = self._redis.get(key)
        if fn:
            return fn(data)
        return data

    def get_str(self, key: str) -> str:
        '''Retrieves a str value from Redis storage based on a given key.
        '''
        return self.get(key, lambda x: x.decode('utf-8'))

    def get_int(self, key: str) -> int:
        '''Retrieves an int value from Redis storage based on a given key.
        '''
        return self.get(key, lambda x: int(x))
