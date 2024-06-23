def main():
    text = str(input())
    convert(text)

def convert(text):
    if ":)" and ":(" in text:
        print(text.replace(":)", "🙂").replace(":(", "🙁"))
    else:
        if ":)" in text:
            print(text.replace(":)", "🙂"))
        elif ":(" in text:
            print(text.replace(":(", "🙁"))

main()