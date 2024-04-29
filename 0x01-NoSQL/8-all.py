#!/usr/bin/env python3
""" list all """
def list_all(mongo_collection):
    all_documents = list(mongo_collection.find())
    return all_documents
