FROM python:3.9

RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev build-essential

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "manage.py", "runserver"]
