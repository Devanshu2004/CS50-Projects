while True:
    try:
        X, Y = input("Fraction: ").split("/")

        x = int(X)
        y = int(Y)

        level = round((x / y) * 100)

        if x > y:
            continue
    except (ValueError, ZeroDivisionError):
        pass
    else:
        break

if level <= 1:
    print("E")
elif level >= 99:
    print("F")
else:
    print(f'{level}%')