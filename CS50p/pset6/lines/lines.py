import sys


def main():
    if len(sys.argv) == 2:
        x, y = sys.argv[1].split(".")
        if y == "py":
            length = line_tester(sys.argv[1])
            print(length)
        else:
            sys.exit("Not a Python file")
    elif len(sys.argv) < 2:
        sys.exit("Too few command-line arguments")
    elif len(sys.argv) > 2:
        sys.exit("Too many command-line arguments")


def line_tester(input_file_name):
    try:
        with open(input_file_name) as file:
            length = 0
            for line in file:
                row = line.lstrip().rstrip().replace(" ", "")
                if row.startswith("#"):
                    pass
                elif row == "":
                    pass
                else:
                    length += 1
        return length
    except FileNotFoundError:
        sys.exit("File does not exist")

if __name__ == "__main__":
    main()