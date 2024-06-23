def main():
    t = input("What time is it? ")
    T = convert(t)

    if 7 <= T <= 8:
        print("breakfast time")
    if 12 <= T <= 13:
        print("lunch time")
    if 18 <= T <= 19:
        print("dinner time")


def convert(time):
    x, y = time.split(":")
    X = float(x)
    Y = float(y)

    return X + (Y/60)


if __name__ == "__main__":
    main()