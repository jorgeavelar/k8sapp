FROM python:3.6-alpine

ENV APP_HOME /k8sapp

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . $APP_HOME

CMD [ "gunicorn","-w 5" ,"run:app"]
