def minNum(samDaily, kellyDaily, difference):
  """
  Finds the minimum number of days needed for Kelly to exceed Sam.
  
  Args:
    samDaily: Number of problems Sam solves in a day
    kellyDaily: Number of problems Kelly solves in a day
    difference: Number of problems Sam is ahead to begin

  Returns:
    int: The minimum number of days needed by Kelly to exceed Sam, or -1 if it is impossible
  """
  if samDaily> kellyDaily:
      return -1
  li = [samDaily,kellyDaily,difference]
  for _,item in enumerate(li):
    if item not in range(1,100):
        return -1
  days = 0
  kelly_sum = 0
  while True:
    if difference <= kelly_sum:
      break
    difference += samDaily
    kelly_sum += kellyDaily
    days += 1

  return days

if __name__ == "__main__":
  print(minNum(2, 5, 5))