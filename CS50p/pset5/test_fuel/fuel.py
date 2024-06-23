def main():
    a = convert(input("Fraction: "))
    b = gauge(a)

    print(b)

def convert(fraction):
    X, Y = fraction.split("/")

    x = int(X)
    y = int(Y)

    if y == 0:
        return ZeroDivisionError

    level = round((x / y) * 100)

    if level < 0 or level > 100:
        return ValueError
    else:
        return level

def gauge(percentage):
    if percentage <= 1:
        return "E"
    elif percentage >= 99:
        return "F"
    else:
        return f'{percentage}%'

if __name__ == "__main__":
    main()