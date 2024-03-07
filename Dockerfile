
FROM python:3.10

# Dependencies for running a python application
RUN apt-get update && apt-get install -y postgresql-client libpq-dev

RUN pip3 install poetry

WORKDIR /app

COPY pyproject.toml ./
RUN poetry install --no-root

# Copy the app into the container itself
COPY todo todo

EXPOSE 6400
# Running our application
CMD ["bash", "-c", "sleep 10 && poetry run flask --app todo run --host 0.0.0.0 --port 6400"]