import os
import sys
from PIL import Image, ImageOps


def main():

    # Checking for correct input
    if len(sys.argv) > 3:
        sys.exit("Too many command-line arguments")
    elif len(sys.argv) < 3:
        sys.exit("Too few command-line arguments")
    else:
        if extension_checker(sys.argv[1], sys.argv[2]):
            sys.exit("Input and output have different extensions")

    # Opening the input file and the shirt file
    try:
        file1 = Image.open(sys.argv[1])
    except FileNotFoundError:
        sys.exit("Input does not exist")

    shirt_file = Image.open("shirt.png")
    size = shirt_file.size
    muppet = ImageOps.fit(file1, size)
    muppet.paste(shirt_file, shirt_file)
    muppet.save(sys.argv[2])


def extension_checker(input_file, output_file):

    # Getting the extensions
    a = os.path.splitext(input_file)
    b = os.path.splitext(output_file)


    # Matching the extensions
    if ".jpg" in input_file or ".png" in input_file or ".jpeg" in input_file:
        if ".jpg" in output_file or ".png" in output_file or ".jpeg" in output_file:
            if a[1] == b[1]:
                return False
            else:
                return True
        else:
            sys.exit("Invalid output")
    else:
        sys.exit("Invalid input")




if __name__ == "__main__":
    main()