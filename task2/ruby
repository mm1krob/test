1. Написати функцію яка додаватиме числа та виводитеме результат виклик повивнен бути в форматі
add_numbers(1,3) #=> 4

def add_numbers(num1,num2)
  puts (num1+num2);
end

2. Функція яка порівнюватиме числа. Якщо перше число більше за друге виводити суму, інакше - різницю.
compare_numbers(1,3) #=> 4
compare_numbers(4,3) #=> 1    - щось тут не клеїться з умовою


def compare_numbers(num1,num2)
  if num1>num2
  puts (num1+num2);
  else puts num2-num1;
  end
end

Функція яка заокруглує число до 2 символів після коми
і перевіряє якщо дробова частина від 0 до 30 виводить це число в квадраті, від 30 до 60 в кубі, від 60 до 100 - корінь квадратний.
round_and_compare(10.01) #=> 1
round_and_compare(10.02) #=> 4
round_and_compare(10.50000011112223) #=> 125000

def round_and_compare(num)
  num = (num % num.floor).round(2) * 100
   if num >= 0 and num < 30
      puts num**2
    elsif num >=30 and num < 60
      puts num**3
    else puts Math.sqrt(num)
   end
end
