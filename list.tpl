<link rel="stylesheet" type="text/css" href="/static/list.css">

<!-- side panel -->
<div id="side-panel">

    <h4> Challenges </h4>
    <ul>
        <li> Learning SQLite3 </li>
        <li> Toggle Tables </li>
        <li> Learning Python </li>

    </ul>

    <h4> NOTES TO GRADER </h4>
    <ul>
        <li> I wasn't able to finish the homework in time, but I got most of it done </li>
        <li> <strong>SORT BUTTONS DO NOT WORK</strong> </li>
        <li> checkbox only stays checked/unchecked when status is changed in edit/:id</li>
    </ul>

    <h4> Helpful Resource </h4>
    <ul>
        <li>bottlepy tutorial</li>
        <li>Stack Overflow</li>
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

    <div id="content">

        %# params = [rows, filter]
        %# rows = [(id, task, status), ...]
        %# filter = one of ['all', 'done', 'tbd', 'pa', 'pd', 'da', 'dd', 'ua', 'ud']

        % rows = params[0]
        % filter = params[1]
        %# sort = params[2]

        %allchecked  = "checked" if filter=="all" else ""
        %donechecked = "checked" if filter=="done" else ""
        %tbdchecked  = "checked" if filter=="tbd" else ""

        <!-- <script type="text/javascript" href="/static/controller.js"> -->

        <form id="filterform" action="/list" method="get">
            <fieldset>
                <legend>Task Filter</legend>
                <input type="radio" name="filter" value="all" {{allchecked}}/>All Tasks
                <input type="radio" name="filter" value="done" {{donechecked}}/>Done Tasks
                <input type="radio" name="filter" value="tbd" {{tbdchecked}}/>TBD Tasks
                <input id="filterbtn" type="submit" value="Filter" />
                <!-- <input id="taskid" type="text"  name="taskid" value="" hidden/> -->
            </fieldset>
            <!-- <br/> -->
            <!-- <input id="filterbtn" type="submit" value="Filter" /> -->
        </form>

        %pachecked = "checked" if filter=="pa" else ""
        %pdchecked = "checked" if filter=="pd" else ""
        %dachecked = "checked" if filter=="da" else ""
        %ddchecked = "checked" if filter=="dd" else ""
        %uachecked = "checked" if filter=="ua" else ""
        %udchecked = "checked" if filter=="ud" else ""

        <form id="sortform" action"/todo" method="get">
            <fieldset>
              <legend>Sort Filter</legend>
              <input type="radio" name="filter" value="pa" {{pachecked}}/>Ascending Posted Date
              <input type="radio" name="filter" value="pd" {{pdchecked}}/> Descending Posted Date
              <input type="radio" name="filter" value="da" {{dachecked}}/> Ascending Due Date
              <input type="radio" name="filter" value="dd" {{ddchecked}}/> Descending Due Date
              <input type="radio" name="filter" value="ua" {{uachecked}}/> Ascending Updated Date
              <input type="radio" name="filter" value="ud" {{udchecked}}/> Descending Updated Date
              <input id="sortbtn" type="submit" value="Sort" />
            </fieldset>

        </form>

        <ul id="todo">
            %for row in rows:
            %statuschecked = "checked" if row[6] else ""
            <li class="task">
                <span class=taskid hidden>{{row[0]}}</span>
                <p class="taskTitle">Title: {{row[1]}}</p>
                <p class="posted">Posted: {{row[2]}}</p>
                <p class="due">Due: {{row[3]}}</p>
                <p class="updated">Last Updated: {{row[4]}}</p>
                <p class="notes">Notes: {{row[5]}}</p>
                <input type="checkbox" class="status" name=status value="done" {{statuschecked}}/>
                <button type="button"><a href='/edit/{{row[0]}}'>Edit</a></button>
                <!-- <a href='/edit/{{row[0]}}'>Edit</a> -->
                <button type="button"><a href='/delete/{{row[0]}}'>Delete</a></button>
                <!-- <a href='/delete/{{row[0]}}'>Delete</a> -->
                <!-- <form action='/edit/{{id}}' method='get'>
                    <input type='button' value='save' name='save'>
                </form> -->
                <!-- <span class="editbtn">
                    <a href="/edit/{{id}}" title="Edit">Edit</a>
                     Edit
                </span> -->
            </li>
            %end
        </ul>


    </div>

</div>

<!-- footer -->
<footer>

    <a id="link" href="#">About Us</a>
    <a id="link" href="#">Contact</a>
    <a id="link" href="#">Privacy</a>
    <a id="link" href="#">Credits</a>

</footer>

<script type="text/javascript" href="/static/controller.js">
