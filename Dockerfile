FROM python:3.10

COPY . /opt/album
WORKDIR /opt/album

RUN pip install poetry
RUN poetry install
RUN poetry run python manage.py migrate
ENV Album_app album/apps.py

EXPOSE 8000
CMD ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]