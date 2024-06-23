def main():
    text = shorten(input("Input: "))
    print("Output: " + text)


def shorten(word):
    ans = word

    if ("a" in word) or ("A" in word):
        ans = ans.replace("a", "").replace("A", "")
    if ("e" in word) or ("E" in word):
        ans = ans.replace("e", "").replace("E", "")
    if ("i" in word) or ("I" in word):
        ans = ans.replace("i", "").replace("I", "")
    if ("o" in word) or ("O" in word):
        ans = ans.replace("o", "").replace("O", "")
    if ("u" in word) or ("U" in word):
        ans = ans.replace("u", "").replace("U", "")

    return ans


if __name__ == "__main__":
    main()