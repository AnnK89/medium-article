def timer_for
  # TODO: Return time taken to execute the given block
  current_time = Time.now

  yield

  time_taken = Time.now - current_time
  return time_taken
end

timer_for do
  (1..100).to_a.shuffle.sort
end
