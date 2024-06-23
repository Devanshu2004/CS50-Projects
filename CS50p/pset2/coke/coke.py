price = int(50)
insert_coin = int(0)
amount_due = price - insert_coin

while amount_due > 0:
    print(f'Amount Due: {amount_due}')
    insert_coin = int(input("Insert Coin: "))
    if insert_coin == 25 or insert_coin == 10 or insert_coin == 5:
        amount_due = amount_due - insert_coin
    else:
        amount_due = amount_due

print(f'Change Owned: {0 - amount_due}')