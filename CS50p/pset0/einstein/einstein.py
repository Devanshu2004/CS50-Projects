def main():
    # Asking the user for mass
    m = int(input("m: "))
    answer(m)

def answer(m):
    ans = m * 90000000000000000
    print(f'E: {ans}')

main()