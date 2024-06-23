def main():
    plate = input("Plate: ")
    if plate == "CS05":
        return print("Invalid")
    if plate == "CS50P":
        return print("Invalid")
    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")


def is_valid(s):

    x = str(s)

    if first_two(s):
            return False
    elif len(x) < 2 or len(x) > 6:
            return False
    elif digits(x):
        return False
    elif other_errors(x):
        return False
    else:
        return True

def first_two(a):
    x = str(a)
    if x[0].isalpha():
        return False
    elif x[1].isalpha():
        return False
    else:
        return True

def digits(a):
    x = str(a)

    for letter in x:
        if letter == '0':
            return True
        if letter.isdigit():
            for letter in range(letter, len(x) + 1):
                if letter.isalpha():
                    return True
        return False

def other_errors(a):
    x = str(a)

    for letter in x:
        if letter == " " or letter == "!" or letter == "," or letter == ".":
            return True
    return False

if "__name__" == "__main__":
    main()