import os
import random
import re
import sys

DAMPING = 0.85
SAMPLES = 10000


def main():
    if len(sys.argv) != 2:
        sys.exit("Usage: python pagerank.py corpus")
    corpus = crawl(sys.argv[1])
    '''ranks = sample_pagerank(corpus, DAMPING, SAMPLES)
    print(f"PageRank Results from Sampling (n = {SAMPLES})")
    for page in sorted(ranks):
        print(f"  {page}: {ranks[page]:.4f}")'''
    ranks = iterate_pagerank(corpus, DAMPING)
    print(f"PageRank Results from Iteration")
    for page in sorted(ranks):
        print(f"  {page}: {ranks[page]:.4f}")


def crawl(directory):
    """
    Parse a directory of HTML pages and check for links to other pages.
    Return a dictionary where each key is a page, and values are
    a list of all other pages in the corpus that are linked to by the page.
    """
    pages = dict()

    # Extract all links from HTML files
    for filename in os.listdir(directory):
        if not filename.endswith(".html"):
            continue
        with open(os.path.join(directory, filename)) as f:
            contents = f.read()
            links = re.findall(r"<a\s+(?:[^>]*?)href=\"([^\"]*)\"", contents)
            pages[filename] = set(links) - {filename}

    # Only include links to other pages in the corpus
    for filename in pages:
        pages[filename] = set(
            link for link in pages[filename]
            if link in pages
        )

    return pages


def transition_model(corpus, page, damping_factor):
    """
    Return a probability distribution over which page to visit next,
    given a current page.

    With probability `damping_factor`, choose a link at random
    linked to by `page`. With probability `1 - damping_factor`, choose
    a link at random chosen from all pages in the corpus.
    """
    model = {} 

    # Total number of files
    length = len(corpus)
    # Num links
    num_links = len(corpus[page])

    if num_links != 0:
        random_probability = (1 - damping_factor) / length
        special_probability = damping_factor / num_links
    else:
        random_probability = (1 - damping_factor) / length
        special_probability = 0

    for file in corpus:
        if num_links == 0:
            model[file] = 1 / length
        else:
            if file not in corpus[page]:
                model[file] = random_probability
            else:
                model[file] = random_probability + special_probability

    if round(sum(model.values()), 5) != 1:
        print(f"Probabilities add upto {sum(model.values())}")
    return model


def sample_pagerank(corpus, damping_factor, n):
    """
    Return PageRank values for each page by sampling `n` pages
    according to transition model, starting with a page at random.

    Return a dictionary where keys are page names, and values are
    their estimated PageRank value (a value between 0 and 1). All
    PageRank values should sum to 1.
    """
    sample_pr = {}
    for page in corpus:
        sample_pr[page] = 0

    sample = None
    for iteration in range(n):
        if sample == None:
            choices = list(corpus.keys())
            sample = random.choice(choices)
            sample_pr[sample] += 1
        else:
            next_sample_probability = transition_model(corpus, sample, damping_factor)
            choices = list(next_sample_probability.keys())
            weights = [next_sample_probability[key] for key in choices]
            sample = random.choices(choices, weights).pop()
            sample_pr[sample] += 1
    sample_pr = {key: value/n for key, value in sample_pr.items()}
    if round(sum(sample_pr.values()), 5) != 1:
        print(f"Error! Probabilities add upto {sum(transition_model.values())}")
    else:
        print(f"Sum of sample pagerank values: {round(sum(sample_pr.values()), 10)}")
    return sample_pr

def iterate_pagerank(corpus, damping_factor):
    """
    Return PageRank values for each page by iteratively updating
    PageRank values until convergence.

    Return a dictionary where keys are page names, and values are
    their estimated PageRank value (a value between 0 and 1). All
    PageRank values should sum to 1.
    """
    iterate_pr = {}
    num_pages = len(corpus)

    for page in corpus:
        iterate_pr[page] = 1 / num_pages

    changes = 1
    iterations = 1 
    while changes >= 0.001:
        changes = 0 
        previous_state = iterate_pr.copy()

        for page in iterate_pr:
            parents = [link for link in corpus if page in corpus[link]]
            first = ((1 - damping_factor) / num_pages)

            second = []
            if len(parents) != 0:
                for parent in parents:
                    num_links = len(corpus[parent])
                    value = previous_state[parent] / num_links
                    second.append(value)

            second = sum(second)
            iterate_pr[page] = first + (damping_factor * second)

            new_changes = abs(iterate_pr[page] - previous_state[page])
            if changes < new_changes:
                changes = new_changes
        iterations += 1
    dictsum = sum(iterate_pr.values())
    iterate_pr = {key: value / dictsum for key, value in iterate_pr.items()}
    print(f"\n Pagerank valuse stable after {iterations} iterations.")
    print(f"Sum of iterate_pagerank values: {round(sum(iterate_pr.values()), 10)}")

    return iterate_pr


if __name__ == "__main__":
    main()
