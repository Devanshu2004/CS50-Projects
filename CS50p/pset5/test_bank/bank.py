def main():
    x = str(input("Greeting: "))
    y = x.strip()

    print("$", end = "")
    print(value(y))


def value(greeting):
    if greeting[0] == "h" or greeting[0] == "H":
        if "hello" in greeting or "Hello" in greeting:
            return 0
        else:
            return 20
    else:
        return 100


if __name__ == "__main__":
    main()