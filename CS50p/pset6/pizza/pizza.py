# Import library
from tabulate import tabulate
import sys
import csv


# List of items
item_details = []


# Check for correct input
def main():
    try:
        if len(sys.argv) == 2:
            x, y = sys.argv[1].split(".")

            if y == "csv":
                if x == "regular" or x == "sicilian":
                    file_handler(sys.argv[1])
                else:
                    sys.exit("File does not exist")
            else:
                sys.exit("Not a CSV file")
        elif len(sys.argv) > 2:
            sys.exit("Too many command-line arguments")
        else:
            sys.exit("Too few command-line arguments")
    except ValueError:
        sys.exit("Not a CSV file")

# Open the desired file
def file_handler(file_name):
    with open(file_name) as file:
        reader = csv.reader(file)
        for row in reader:
            item_details.append(row)

    # Print the final desired output
    print(tabulate(item_details, headers = "firstrow", tablefmt="grid"))

if __name__ == "__main__":
    main()