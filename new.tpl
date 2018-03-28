<link rel="stylesheet" type="text/css" href="/static/new.css">

<!-- side panel -->
<div id="side-panel">

    <h4> Challenges </h4>
    <ul>
        <li>Saving data into SQLite3</li>
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

    <h3> cmps183: Homework 3 </h3>

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

    <h3> Add a task to your todo list </h3>

    <div id="form">

        <form action="/new" method="GET">
            <h4> Task Title: </h4>
            <input type="text" size="100" maxlength="100" name="task" id='newinput'>
            <h4> Due Date: </h4>
            <input type="date" name="duedate" id='duedateinput'>
            <script type="text/javascript" src="/static/date.js"></script>
            <h4 id='newnotesinput'> Notes: </h4>
            <input type="text" size="100" maxlength="100" name="notes">
            <br>
            <br>
            <input type="submit" name="save" value="save">
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
