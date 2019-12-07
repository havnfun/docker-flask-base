FROM python:3.6
RUN apt-get update
RUN apt-get install libpq-dev
RUN apt-get --yes --force-yes install sass
RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "manage.py", "recreate_db"]
CMD ["python", "manage.py", "setup_dev"]
CMD ["honcho", "start", "-f", "Local"]
EXPOSE 5000
