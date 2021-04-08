# FlaskBuddy

## [Kubernetes Primer](https://docs.google.com/presentation/d/10XrrzIP0wZQpz4fMb2Am2wYDW_f1E4UV0zFzl65nNmU/edit?usp=sharing)

## Installation

### Prerequisites

- Python 3
- pipenv
- Minikube

### Setup

```bash
pipenv install \
  && pipenv shell \
  && ./build.sh
```

## Running

By default, this will pull an image from a remote repository.  If you made local
changes to the `FlaskBuddy.py`, you'll need to modify the following
instructions.

```bash
$ mfa 123456 --k8s

$ kubectl apply -f buddies.yml
Starting flaskbuddy_bob_1 ... done
Starting flaskbuddy_ann_1 ... done
```

This will start two Containers using the same trivial Python Flask application
that communicate with one another.

### Testing

```bash
$ curl http://localhost:8080
{"hostname":"5e316be14341"}

$ curl http://localhost:8081
{"hostname":"1e884d7fa633"}

$ curl http://localhost:8080/buddy
{"buddy":{"hostname":"1e884d7fa633"},"me":"5e316be14341"}

$ curl http://localhost:8081/buddy
{"buddy":{"hostname":"5e316be14341"},"me":"1e884d7fa633"}
```
