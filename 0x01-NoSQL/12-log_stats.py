#!/usr/bin/env python3
""" log_stats """
from pymongo import MongoClient

if __name__ == "__main__":
    client = MongoClient('mongodb://127.0.0.1:27017')
    logs = client.logs.nginx
    all_logs = list(logs.find())
    print(logs.count_documents({}), 'logs')
    print("Methods:")
    print(f"    method GET: {logs.count_documents({'method':'GET'})}")
    print(f"    method POST: {logs.count_documents({'method':'POST'})}")
    print(f"    method PUT: {logs.count_documents({'method':'PUT'})}")
    print(f"    method PATCH: {logs.count_documents({'method':'PATCH'})}")
    print(f"    method DELETE: {logs.count_documents({'method':'DELETE'})}")
