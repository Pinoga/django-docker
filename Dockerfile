#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM python:3.6-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache make g++ bash git openssh postgresql-dev curl

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt
COPY ./ /usr/src/app

EXPOSE 80

CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:80"]
