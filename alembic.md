* cd to the project's root dir, make sure alembic is installed to your virtual env. Then run:
```bash
poetry run alembic init alembic
```

* Within the root dir of the project, open `alembic.ini` file and provide `sqlalchemy.url` as following:
```ini
sqlalchemy.url = postgresql://postgres.ajchjqo.....
```
