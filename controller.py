import sqlite3
import time
from datetime import datetime

from bottle import route, run, debug, template, request, redirect, static_file

@route('/')
@route('/home')
@route('/index')
def index():
    return template('index')

@route('/list')
def todo_list():
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    query = "SELECT * FROM todo "
    filter = request.GET.filter
    if filter == "tbd":
        query += "WHERE status=0"
    elif filter == "done":
        query += "WHERE status=1"
    elif filter == "pa":
        query += "ORDER BY posted DESC"
    elif filter == "da":
        query += "ORDER BY due ASC"
    elif filter == "dd":
        query += "ORDER BY due DESC"
    elif filter == "ua":
        query += "ORDER BY updated ASC"
    elif filter == "ud":
        query += "ORDER BY updated DESC"
    else:
        filter="all"
    c.execute(query)
    rows = c.fetchall()
    c.close()
    output = template('list', params=[rows, filter])
    return output

@route('/new', method='GET')
def new_item():

    if request.GET.save:

        # new task, date, notes
        newTask = request.GET.task.strip()
        newDueDate = request.GET.duedate.strip()
        newNotes = request.GET.notes.strip()

        # new date posted, last updated
        unix = time.time()
        todate = datetime.now().strftime('%Y-%m-%d')
        now = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        conn = sqlite3.connect('todo.db')
        c = conn.cursor()

        c.execute("INSERT INTO todo (task, status, due, posted, updated, notes) VALUES (?,?,?,?,?,?)", (newTask, 0, newDueDate, todate, now, newNotes))

        new_ID = c.lastrowid

        conn.commit()
        c.close()

        redirect('/list')
    else:
        return template('new.tpl')

@route('/edit/<id:int>', method='GET')
# @route('/edit/<no:int>', method='POST')
def edit_item(id):

    if request.GET.save:

        editTask = request.GET.task.strip()
        status = request.GET.task.strip()
        editDate = request.GET.duedate.strip()
        editNotes = request.GET.notes.strip()
        new_status = request.GET.status.strip()

        now = datetime.now().strftime('%Y-%m-%d %H:%M:%S')


        new_status = (1 if new_status == 'closed' else 0)

        conn = sqlite3.connect('todo.db')
        c = conn.cursor()
        c.execute("UPDATE todo SET task = ?, status = ?, due = ?, notes = ?, updated = ? WHERE id = ?", (editTask, new_status, editDate, editNotes, now, id))
        conn.commit()

        redirect('/list')

        # return '<p>The item numbber %s was successfully updated.</p>' % id
    else:
        conn = sqlite3.connect('todo.db')
        c = conn.cursor()
        c.execute("SELECT task, status, due, notes, posted, updated FROM todo WHERE id = ?", (str(id),))
        current = c.fetchone()

        return template('edit_task', old=current, id=id)

@route('/delete/<id:int>', method='GET')
def delete_item(id):

    if request.GET.delete:

        conn = sqlite3.connect('todo.db')
        c = conn.cursor()
        # c.execute("SELECT FROM todo WHERE id = ?", (str(id),))
        c.execute("DELETE FROM todo WHERE id = ?", (str(id)))
        conn.commit()

        redirect('/list')

        # return '<p>The item number %s was successfully deleted</p>'
    else:
        return template('delete_task', id=id)

@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='./static')

run(host='localhost', port=8080 ,debug=True)
