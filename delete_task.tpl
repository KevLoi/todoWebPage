<link rel='stylesheet' type='text/css' href='/static/delete_task.css'>

<!-- side panel -->
<div id="side-panel">

    <h4> Challenges </h4>
    <ul>
        <li>Querying the delete to SQLite3</li>
        <li>Accessing SQLite3/Setting up dev environment</li>
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

        <h2 id='content'>Are you sure you want to delete this task with ID = {{id}}?</h2>
        <p id='content'>If yes, click 'delete'</p>
        <p id='content'>If no, click back</p>

        <form action='/delete/{{id}}' method='get' id='content'>
            <input type="submit" value="delete" name="delete">
        </form>


    </div>

</div>
