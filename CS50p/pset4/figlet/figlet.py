import sys
from pyfiglet import Figlet
import random

figlet = Figlet()

if len(sys.argv) == 1:
    isRandomFont = True
elif len(sys.argv) == 3 and (sys.argv[1] == "-f" or sys.argv[1] == "-font"):
    isRandomFont = False
else:
    sys.exit("Invalid usage")

text = input("Input: ")

figlet.getFonts()

if isRandomFont == False:
    try:
        figlet.setFont(font = sys.argv[2])
    except:
        sys.exit("Invalid usage")
else:
    font = random.choice(figlet.getFonts())

print("Output: ")
print(figlet.renderText(text))