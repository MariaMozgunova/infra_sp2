FROM python:3.8.5

LABEL author="Maria Mozgunova" version=1 date="16.12.2020"

RUN mkdir /code

WORKDIR /code

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000

