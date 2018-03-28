document.querySelector('#todo')
  .addEventListener('click', (event) => {
      console.log(event);
      alert("Event target: " + event.target);
      var action, taskid;
      if (event.target.closest('LI.task')) {
          taskid = event.target.closest('LI.task').children[0].innerHTML;
          alert("task id = " + taskid);
      };
      if (event.target.closest('SPAN.editbtn')) {
          action = "/edit/" + taskid;
      };
      if (event.target.closest('INPUT.status')) {
          action = "/status/" + taskid;
      };
      console.log("action = " + action);
      var filterform = document.querySelector('#filterform');
      filterform.action = action;
      filterform.method = "post"
      document.querySelector('#filterbtn').click();
    });
