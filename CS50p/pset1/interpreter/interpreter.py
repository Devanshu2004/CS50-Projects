expessions = input("Expression: ")

x, y, z = expessions.split(" ")

value1 = float(x)
value2 = float(z)

if y == "+":
    print(value1 + value2)
elif y == "-":
    print(value1 - value2)
elif y == "*":
    print(value1 * value2)
elif y == "/":
    print(value1 / value2)