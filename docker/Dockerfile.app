FROM python:3.10

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    build-essential vim curl tree wget

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn", "src.main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]
