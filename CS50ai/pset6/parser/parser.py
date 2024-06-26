import nltk
import sys

TERMINALS = """
Adj -> "country" | "dreadful" | "enigmatical" | "little" | "moist" | "red" | "crazy" | "good"
Adv -> "down" | "here" | "never" | "nearly" | "not" | "with"
Conj -> "and" | "until"
Det -> "a" | "an" | "his" | "my" | "the" | "this"
N -> "armchair" | "companion" | "day" | "door" | "hand" | "he" | "himself"
N -> "holmes" | "home" | "i" | "mess" | "paint" | "palm" | "pipe" | "she" | "gabrieal"
N -> "smile" | "thursday" | "walk" | "we" | "word" | "puzzle" | "words"
P -> "at" | "before" | "in" | "of" | "on" | "to" | "until"
V -> "arrived" | "came" | "chuckled" | "had" | "lit" | "said" | "sat"
V -> "smiled" | "tell" | "were" | "went" | "solving" | "is" | "has"
"""

NONTERMINALS = """
S -> NP VP | S Conj S | VP NP | S P S | S NP | S P NP
NP -> N | Det AA N | Det N | NP Adv V | AA N | Det N AA | P NP
AA -> Adj | Adj AA | Adv
VP -> V | V P NP | Adv V | V P | V AA
"""

grammar = nltk.CFG.fromstring(NONTERMINALS + TERMINALS)
parser = nltk.ChartParser(grammar)


def main():

    # If filename specified, read sentence from file
    if len(sys.argv) == 2:
        with open(sys.argv[1]) as f:
            s = f.read()

    # Otherwise, get sentence as input
    else:
        s = input("Sentence: ")

    # Convert input into list of words
    s = preprocess(s)

    # Attempt to parse sentence
    try:
        trees = list(parser.parse(s))
    except ValueError as e:
        print(e)
        return
    if not trees:
        print("Could not parse sentence.")
        return

    # Print each tree with noun phrase chunks
    for tree in trees:
        tree.pretty_print()

        print("Noun Phrase Chunks")
        for np in np_chunk(tree):
            print(" ".join(np.flatten()))


def preprocess(sentence):
    """
    Convert `sentence` to a list of its words.
    Pre-process sentence by converting all characters to lowercase
    and removing any word that does not contain at least one alphabetic
    character.
    """
    print(f"Original sentence: {sentence}")
    tokens = nltk.word_tokenize(sentence)

    tokens = [word.lower() for word in tokens]
    print(f"All tokens: {tokens}")

    filter_alphabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
                        "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    filtered = []

    for word in tokens:
        for letter in word:
            if letter in filter_alphabets:
                filtered.append(word)
                break
            else:
                continue
    print(f"Filtered tokens: {filtered}")
    return filtered

def np_chunk(tree):
    """
    Return a list of all noun phrase chunks in the sentence tree.
    A noun phrase chunk is defined as any subtree of the sentence
    whose label is "NP" that does not itself contain any other
    noun phrases as subtrees.
    """
    nps = []

    for subtree in tree.subtrees():
        if (subtree.lable() == 'NP'):
            nps.append(subtree)
    return nps

if __name__ == "__main__":
    main()
