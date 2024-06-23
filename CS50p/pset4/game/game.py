import random

while True:
    try:
        level = int(input("Level: "))
        if level > 0:
            break
    except ValueError:
        pass

ans = random.randint(1, level)

while True:
    try:
        guess = int(input("Guess: "))
        if guess > 0 and guess < level:
            if guess > ans:
                print("Too large!")
            elif guess < ans:
                print("Too small!")
            else:
                print("Just right!")
                break
    except ValueError:
        pass