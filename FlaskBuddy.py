#!/usr/bin/env python3

from socket import gethostname
from os import environ
from flask import Flask
import requests

app = Flask(__name__)
host = gethostname()


@app.route('/')
def me():
    """
    returns information about this service
    """
    return {'hostname': host}, 200


@app.route('/buddy')
def buddy():
    """
    returns information about this service AND its buddy
    """
    try:
        buddy_uri = environ['BUDDY_URI']

        return {
            'me': host,
            'buddy': requests.get(buddy_uri).json()
        }

    except KeyError:
        return {'error': 'missing BUDDY_URI environment variable'}, 501
