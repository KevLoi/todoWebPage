import sqlite3
import time
import datetime

unix = time.time()
todate = str(datetime.datetime.fromtimestamp(unix).strftime('%Y-%m-%d'))
now = str(datetime.datetime.fromtimestamp(unix).strftime('%Y-%m-%d %H:%m:%s'))

conn = sqlite3.connect('todo.db')
conn.execute("CREATE TABLE IF NOT EXISTS todo (id INTEGER PRIMARY KEY, task char(100) NOT NULL, posted DATE, due DATE, updated DATE, notes TEXT, status bool NOT NULL)")
conn.commit()
