FROM python:3.7

WORKDIR ./hello_world
 
ADD . .

RUN pip install -r requirements.txt

CMD ["python", "./main.py"]
