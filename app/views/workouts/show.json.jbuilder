json.extract! @workout, :id, :name, :created_at, :updated_at

json.exercises @workout.exercises do |exercise|
  json.extract! exercise, :name, :duration
end
