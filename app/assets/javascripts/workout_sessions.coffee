$ ->
  container = $('.workout_session[data-workout-url]')
  return if container.length == 0
  $.get container.data('workout-url'), (data, status, xhr) ->
    exercises = data.exercises
    setsRemaining = container.data('sets')
    exerciseIndex = -1
    exerciseEndTime = 0

    timer = setInterval ->
      if Date.now() >= exerciseEndTime
        exerciseIndex += 1
        if exerciseIndex >= exercises.length
          setsRemaining -= 1
          if setsRemaining == 0
            clearInterval(timer)
            container.find('#exercise_name').text("You're finished!")
            container.find('#time_remaining').text('')
            return
          exerciseIndex = 0

        exercise = exercises[exerciseIndex]
        container.find('#exercise_name').text(exercise.name)
        exerciseEndTime = Date.now() + exercise.duration * 1000
      container.find('#time_remaining').text(formatTime(exerciseEndTime - Date.now()))
    , 100

formatTime = (milliseconds) ->
  seconds = milliseconds/1000
  minutes = Math.floor(seconds/60)
  seconds -= minutes * 60

  seconds = Math.round(seconds * 1000) / 1000
  seconds = '' + seconds
  if seconds < 10
    seconds = '0' + seconds
  if seconds.indexOf('.') == -1
    seconds = seconds + '.0'
  decimalPlacesCount = 3 - (seconds.length - seconds.indexOf('.') - 1)
  seconds += '0'.repeat(decimalPlacesCount)
  "#{minutes}:#{seconds}"
