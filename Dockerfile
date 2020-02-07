FROM python:3.6.10-alpine3.11

COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY ./FlaskBuddy.py /app
ENV FLASK_APP=FlaskBuddy.py
ENTRYPOINT [ "python", "-m", "flask", "run", "--host=0.0.0.0", "--port=80" ]
