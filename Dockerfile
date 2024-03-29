FROM python:3.9-alpine

WORKDIR /family

RUN apk update && apk upgrade && apk add sqlite && \
        wget https://github.com/andylebedev/Family-records/archive/refs/heads/main.zip && \
        unzip main.zip && \
        mv Family-records-main/* /family/ && \
        rm -rf Family-records-main && \
        python -m pip install --upgrade pip && \
        pip3 install -r requirements.txt && \
        sqlite3 familytree.db < db.init
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
