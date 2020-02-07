#!/usr/bin/env python3

import socket
from os import environ
from flask import Flask, abort
import requests

app = Flask(__name__)

@app.route('/')
def me():
    host = socket.gethostname()
    return {"hostname":host}, 200

@app.route('/buddy')
def buddy():
    host = socket.gethostname()
    try:
        buddy_uri = environ['BUDDY_URI']
        return {
            "me": host, 
            "buddy":requests.get(buddy_uri).json(),
            }
    except KeyError:
        return '{"error":"missing BUDDY_URI environment variable"}', 501
