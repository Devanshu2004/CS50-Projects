sentence = str(input("camelCase: "))
print("snake_case: ", end = "")

for letter in sentence:
    if letter.islower():
        print(letter, end = "")
    elif letter.isupper():
        print("_" + letter.lower(), end = "")

print()