Installation
=============


Prerequisites
--------------

- Python 3
- pipenv


Setup
------

    $ pipenv install
    $ pipenv shell
    $ ./build.sh


Running
========

    $ pipenv shell

    $ docker-compose up
    Starting flaskbuddy_bob_1 ... done
    Starting flaskbuddy_ann_1 ... done

This will start two Containers using the same trivial Python Flask application
that communicate with one another.

    $ curl http://localhost:8080
    {"hostname":"5e316be14341"}

    $ curl http://localhost:8081
    {"hostname":"1e884d7fa633"}

    $ curl http://localhost:8080/buddy
    {"buddy":{"hostname":"1e884d7fa633"},"me":"5e316be14341"}

    $ curl http://localhost:8081/buddy
    {"buddy":{"hostname":"5e316be14341"},"me":"1e884d7fa633"}
