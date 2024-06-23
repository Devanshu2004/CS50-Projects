Items = {}

while True:
    try:
        x = str(input())
        Item = x.upper()

        if Item in Items:
            Items[Item] += 1
        else:
            Items[Item] = 1

    except EOFError:
        break

if len(Items) == 0:
    pass
else:
    FinalItems = sorted(Items.items())
    for x,y in FinalItems:
        print(y, x)