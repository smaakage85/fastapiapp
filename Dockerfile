ARG python_version
FROM python:${python_version}-slim-buster
# FROM dataanalyse-docker-local.artifactory.ccta.dk/mlemba/py${python_version}:latest

WORKDIR /code

COPY --chown=root:root --chmod=0644 ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
 
COPY --chown=root:root --chmod=0644 ./main.py /code/

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
