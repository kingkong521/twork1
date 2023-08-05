def fizzbuzz(n):
  for i in range(1, n + 1):
    if i % 3 == 0 and i % 5 == 0:
      print("FizzBuzz")
    elif i % 3 == 0:
      print("Fizz")
    elif i % 5 == 0:
      print("Buzz")
    else:
      print(str(i))

def fizzbuzz_comprehension(n):
  fizzbuzz = ["Fizz"*(i%3==0)+"Buzz"*(i%5==0) or str(i) for i in range(1, n+1)]
  print('\n fizzbuzz comprehension way\n',fizzbuzz)

if __name__ == "__main__":
  fizzbuzz_comprehension(115)