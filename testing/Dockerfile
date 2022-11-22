FROM python:3

WORKDIR /app

COPY ./testing ./
COPY ./backend ./

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "./start_test.sh" ]
