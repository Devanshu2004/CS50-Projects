x = str(input("Greeting: "))

value = x.strip().lower()

if value[0] == "h":
    if "hello" in value:
        print("$0")
    else:
        print("$20")
else:
    print("$100")