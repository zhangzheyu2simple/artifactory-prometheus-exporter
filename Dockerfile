FROM python:3.5-slim-stretch
MAINTAINER Petr Jurasek

COPY ./Pipfile /app/
COPY ./Pipfile.lock /app/
WORKDIR /app

RUN pip install pipenv
RUN pipenv sync && pipenv lock -r > requirements.txt && pip install -r requirements.txt

COPY ./ /app

EXPOSE 9600

ENTRYPOINT ["python"]
CMD ["main.py"]