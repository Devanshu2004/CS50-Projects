menu = {
    "baja taco": 4.00,
    "burrito": 7.50,
    "bowl": 8.50,
    "nachos": 11.00,
    "quesadilla": 8.50,
    "super burrito": 8.50,
    "super quesadilla": 9.50,
    "taco": 3.00,
    "tortilla salad": 8.00
}

amount = 0.00

while True:
    try:
        a = input("Item: ")
        order = a.lower()

        if order in menu:
            amount = amount + menu[order]
    except EOFError:
        print()
        break
    else:
        print(f'Total: ${amount:.2f}')
