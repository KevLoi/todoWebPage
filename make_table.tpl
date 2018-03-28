%# params = [rows, filter]
%# rows = [(id, task, status), ...]
%# filter = one of ['all', 'done', 'tbd']

% rows = params[0]
% filter = params[1]
%# sort = params[2]

%allchecked  = "checked" if filter=="all" else ""
%donechecked = "checked" if filter=="done" else ""
%tbdchecked  = "checked" if filter=="tbd" else ""

<!-- <script type="text/javascript" href="/static/controller.js"> -->

<form id="filterform" action="/todo" method="get">
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

%# duechecked = "checked" if sort=="due" else ""
%# postedchecked = "checked" if sort=="posted" else ""
%# updatedchecked = "checked" if sort=="updated" else ""

<form id="sortform" action"/todo" method="get">
    <fieldset>
        <legend>Sort By</legend>
        <input type="radio" name="sort" value="due" />Due Date
        <input type="radio" name="sort" value="posted" />Date Posted
        <input type="radio" name="sort" value="updated" />Last Updated
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
        <a href='/edit/{{row[0]}}'>Edit</a>
        <a href='/delete/{{row[0]}}'>Delete</a>
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

<script type="text/javascript" href="/static/controller.js">
