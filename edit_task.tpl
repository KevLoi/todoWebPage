<link rel="stylesheet" type="text/css" href="/static/edit_task.css">

<!-- side panel -->
<div id="side-panel">

    <h4> Challenges </h4>
    <ul>
        <li>Querying to update and save data into SQLite3</li>
        <li>Linking the edit to route to this page</li>
    </ul>

    <h4> NOTES TO GRADER </h4>
    <ul>
        <li> Pretty sure everything works fine on this page </li>
    </ul>

    <h4> Helpful Resources </h4>
    <ul>
        <li> bottlepy tutorial </li>
        <li> Stack Overflow </li>
    </ul>

</div>
<!-- end side panel -->

<!-- header -->
<header>

    <h3> cmps183: Homework 2 </h3>

</header>
<!-- end header -->

<hr style="margin-left: 160px;">

<!-- main body -->
<div id="main-section">

    <div id="navbar">

        <a id="link" href="/">Home</a>
        <a id="link" href="/list">Todo List</a>
        <a id="link" href="/new">Todo Form</a>

    </div>

    <div id="content">

        %#template for editing a task
        %#the template expects to receive a value for "id" as well a "old", the text of the selected ToDo item
        <p>Edit the task with ID = {{id}}</p>
        <form action="/edit/{{id}}" method="get">
            <h4> Task Title: </h4>
            <input type="text" name="task" value="{{old[0]}}" size="100" maxlength="100" id='editinput'>
            <!-- <h4>status</h4>
            <input type="text" name="status" value="{{old[1]}}"> -->
            <h4>Due Date: </h4>
            <input type="date" name="duedate" value="{{old[2]}}" id='editinput'>
            <h4>Date Posted: {{old[4]}}</h4>
            <h4>Last Updated: {{old[5]}}</h4>
            <h4>Description/Notes: </h4>
            <input type="text" name="notes" value="{{old[3]}}" size="100" maxlength="100" id='editinput'>
            <h4 id="statusUpdate">Status</h4>
            <select name="status">
                <option>open</option>
                <option>closed</option>
            </select>
            <br>
            <input type="submit" name="save" value="save" id='save'>

        </form>


    </div>

</div>

<hr style="margin-left: 160px;">

<!-- footer -->
<footer>

    <a id="link" href="#">About Us</a>
    <a id="link" href="#">Contact</a>
    <a id="link" href="#">Privacy</a>
    <a id="link" href="#">Credits</a>

</footer>
<!-- end footer -->
