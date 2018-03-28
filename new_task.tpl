<p>Add a new task to the ToDo list:</p>
<form action="/new" method="GET">
    <h4> Task Title: </h4>
    <input type="text" size="100" maxlength="100" name="task">
    <h4> Due Date: </h4>
    <input type="date" name="duedate">
    <h4> Notes: </h4>
    <input type="text" size="100" maxlength="100" name="notes">
    <input type="submit" name="save" value="save">
</form>
