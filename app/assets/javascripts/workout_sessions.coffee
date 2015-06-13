$ ->
  container = $('.workout_session[data-workout-url]')
  return if container.length == 0
  $.get container.data('workout-url'), (data, status, xhr) ->
    exercises = data.exercises
    setsRemaining = container.data('sets')
    exerciseIndex = -1
    timeRemaining = 0

    timer = setInterval ->
      if timeRemaining < 1
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
        timeRemaining = exercise.duration
      container.find('#time_remaining').text(timeRemaining)
      timeRemaining -= 1
    , 1000
