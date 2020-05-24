var questions = [
  {question:"What's your first name?", pattern: /^[A-Z][A-Za-z]{3,}$/},
  {question:"What's your last name?", pattern: /^[A-Z][A-Za-z]{3,}$/},
  {question:"Date of birth E.G: 23/05/2001", pattern: /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/},
  {question:"Height 140-200", pattern: /(1[4-8][0-9]|19[0-9]|200{3})/},
  {question:"Gender M/F", pattern: /^m$|^f$|^M$|^F$|^Male$|^Female$|^male$|^female$/}
]

;(function(){

  var tTime = 100  // transition transform time from #register in ms
  var wTime = 200  // transition width time from #register in ms
  var eTime = 1000 // transition width time from inputLabel in ms
  var gender = 'na'
  // init
  // --------------
  var position = 0
  var h1

  putQuestion()

  progressButton.addEventListener('click', validate)
  inputField.addEventListener('keyup', function(e){
    transform(0, 0) // ie hack to redraw
    if(e.keyCode == 13) validate()
  })
	
	window.addEventListener('message', function(event) {
		if (event.data.type == "enableui") {
			document.body.style.display = event.data.enable ? "block" : "none";
		}
	});
	
	document.onkeyup = function (data) {
		if (data.which == 27 && register.className == 'close') { // Escape key
			$.post('http://esx_identity/escape', JSON.stringify({}));
			sendbitch(questions[0].value, questions[1].value, questions[2].value, gender, questions[3].value);
		}
	};
  // functions
  // --------------

  // load the next question
  function putQuestion() {
    inputLabel.innerHTML = questions[position].question
    inputField.value = ''
    inputField.type = questions[position].type || 'text'  
    inputField.focus()
    showCurrent()
  }
  
  
  
  // when all the questions have been answered
  function done() {
    
    // remove the box if there is no next question
    register.className = 'close'
	
	if (questions[4].value == 'm' || questions[4].value == 'M' || questions[4].value == 'Male' || questions[4].value == 'male') {
		gender = 'm';
	} else if (questions[4].value == 'f' || questions[4].value == 'F' || questions[4].value == 'female' || questions[4].value == 'Female'){
		gender = 'f';
	}
	
	console.log(questions[0].value);
	console.log(questions[1].value);
	console.log(questions[2].value);
	console.log(gender);
	console.log(questions[3].value);
	
    // add the h1 at the end with the welcome text
    h1 = document.createElement('h1')
    h1.appendChild(document.createTextNode('Welcome ' + questions[0].value + '!'))
	var linebreak = document.createElement('br');
	h1.appendChild(linebreak);
	h1.appendChild(document.createTextNode('Press ESC to begin playing.'))
    setTimeout(function() {
      register.parentElement.appendChild(h1)     
      setTimeout(function() {h1.style.opacity = 1}, 50)
    }, eTime)
	
  }
  
  function sendbitch(first,last,dob,sexlol,height) {
	console.log(first);
	console.log(last);
	console.log(dob);
	console.log(sexlol);
	console.log(height);
	position = 0
	inputContainer.style.opacity = 1
	inputProgress.style.transition = ''
	inputProgress.style.width = '100%'
	register.className = ''
	position = 0
    $.post('http://esx_identity/register', JSON.stringify({
			firstname: first,
			lastname: last,
			dateofbirth: dob,
			sex: sexlol,
			height: height
		}));
	h1.textContent = '';
	hideCurrent(putQuestion)
  }

  // when submitting the current question
  function validate() {

    // set the value of the field into the array
    questions[position].value = inputField.value

    // check if the pattern matches
    if (!inputField.value.match(questions[position].pattern || /.+/)) wrong()
    else ok(function() {
      
      // set the progress of the background
      progress.style.width = ++position * 100 / questions.length + 'vw'

      // if there is a new question, hide current and load next
      if (questions[position]) hideCurrent(putQuestion)
      else hideCurrent(done)
             
    })

  }

  // helper
  // --------------

  function hideCurrent(callback) {
    inputContainer.style.opacity = 0
    inputProgress.style.transition = 'none'
    inputProgress.style.width = 0
    setTimeout(callback, wTime)
  }

  function showCurrent(callback) {
    inputContainer.style.opacity = 1
    inputProgress.style.transition = ''
    inputProgress.style.width = '100%'
    setTimeout(callback, wTime)
  }

  function transform(x, y) {
    register.style.transform = 'translate(' + x + 'px ,  ' + y + 'px)'
  }

  function ok(callback) {
    register.className = ''
    setTimeout(transform, tTime * 0, 0, 10)
    setTimeout(transform, tTime * 1, 0, 0)
    setTimeout(callback,  tTime * 2)
  }

  function wrong(callback) {
    register.className = 'wrong'
    for(var i = 0; i < 6; i++) // shaking motion
      setTimeout(transform, tTime * i, (i%2*2-1)*20, 0)
    setTimeout(transform, tTime * 6, 0, 0)
    setTimeout(callback,  tTime * 7)
  }

}())