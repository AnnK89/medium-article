def circle_area(radius)
  # small change for new commit
  if radius.negative?
    return 0
  else
    return 3.14 * (radius * radius)
  end
end
