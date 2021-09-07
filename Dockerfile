FROM python:3.8 as base
WORKDIR /app
ENV LC_ALL=C.UTF-8

RUN apt update && \
    pip install poetry==1.1.6

COPY poetry.lock pyproject.toml ./
RUN poetry install --no-dev

COPY . .
CMD ["poetry", "run", "python", "run.py"]