import inflect

p = inflect.engine()

Names = []

while True:
    try:
        name = input("Name: ")
        if name in Names:
            pass
        else:
            Names.append(name)
    except EOFError:
        break

print()
print("Adieu, adieu, to ", end = "")
print(p.join(Names))

