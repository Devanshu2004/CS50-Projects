import csv
import sys

from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier

TEST_SIZE = 0.4


def main():

    # Check command-line arguments
    if len(sys.argv) != 2:
        sys.exit("Usage: python shopping.py data")

    # Load data from spreadsheet and split into train and test sets
    evidence, labels = load_data(sys.argv[1])
    X_train, X_test, y_train, y_test = train_test_split(
        evidence, labels, test_size=TEST_SIZE
    )

    # Train model and make predictions
    model = train_model(X_train, y_train)
    predictions = model.predict(X_test)
    sensitivity, specificity = evaluate(y_test, predictions)

    # Print results
    print(f"Correct: {(y_test == predictions).sum()}")
    print(f"Incorrect: {(y_test != predictions).sum()}")
    print(f"True Positive Rate: {100 * sensitivity:.2f}%")
    print(f"True Negative Rate: {100 * specificity:.2f}%")


def load_data(filename):
    """
    Load shopping data from a CSV file `filename` and convert into a list of
    evidence lists and a list of labels. Return a tuple (evidence, labels).

    evidence should be a list of lists, where each list contains the
    following values, in order:
        - Administrative, an integer
        - Administrative_Duration, a floating point number
        - Informational, an integer
        - Informational_Duration, a floating point number
        - ProductRelated, an integer
        - ProductRelated_Duration, a floating point number
        - BounceRates, a floating point number
        - ExitRates, a floating point number
        - PageValues, a floating point number
        - SpecialDay, a floating point number
        - Month, an index from 0 (January) to 11 (December)
        - OperatingSystems, an integer
        - Browser, an integer
        - Region, an integer
        - TrafficType, an integer
        - VisitorType, an integer 0 (not returning) or 1 (returning)
        - Weekend, an integer 0 (if false) or 1 (if true)

    labels should be the corresponding list of labels, where each label
    is 1 if Revenue is true, and 0 otherwise.
    """
    def type_value(position, inside = None, value = ''):
        types = [int, float, int, float, int, float, float, float, float, float,
                tuple(range(0, 12)), int, int, int, int, (0, 1), (0, 1)]

        try:
            value = types[position][inside]
        except TypeError:
            value = types[position](value)
        return value

    with open(filename, 'r') as csv_file:
        csv_reader = csv.reader(csv_file)
        next(csv_reader)

        months = ['jan', 'feb', 'mar', 'apr', 'may', 'june', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec']
        evidences = []
        labels = []

        for line in csv_reader:
            ev = []

            for num_value in range(len(line)):
                if num_value == 17:
                    labels.append(1 if line[num_value] == 'TRUE' else 0)
                elif num_value == 10:
                    month = line[num_value].lower()
                    month = months.index(month)
                    ev.append(type_value(num_value, inside = month))
                elif num_value == 15:
                    i = 0
                    if line[num_value] == 'Returning_Visitor':
                        i = 1
                    ev.append(type_value(num_value, inside = i))
                elif num_value == 16:
                    i = 0
                    if line[num_value].lower() == 'true':
                        i = 1
                    ev.append(type_value(num_value, inside = i))
                else:
                    ev.append(type_value(num_value, value = line[num_value]))
            evidences.append(ev)
    return (evidences, labels)

def train_model(evidence, labels):
    """
    Given a list of evidence lists and a list of labels, return a
    fitted k-nearest neighbor model (k=1) trained on the data.
    """
    model = KNeighborsClassifier(n_neighbors=1)
    x = evidence
    y = labels

    model.fit(x, y)

    return model


def evaluate(labels, predictions):
    """
    Given a list of actual labels and a list of predicted labels,
    return a tuple (sensitivity, specificity).

    Assume each label is either a 1 (positive) or 0 (negative).

    `sensitivity` should be a floating-point value from 0 to 1
    representing the "true positive rate": the proportion of
    actual positive labels that were accurately identified.

    `specificity` should be a floating-point value from 0 to 1
    representing the "true negative rate": the proportion of
    actual negative labels that were accurately identified.
    """
    pl = 0
    nl = 0
    sensitivity = 0
    specificity = 0

    for c in range(len(labels)):
        
        if labels[c] == 1:
            pl += 1
            if predictions[c] == labels[c]:
                sensitivity += 1
        elif labels[c] == 0:
            nl += 1
            if predictions[c] == labels[c]:
                specificity += 1
    
    p_rate = sensitivity / pl
    n_rate = specificity / nl

    return (p_rate, n_rate)

if __name__ == "__main__":
    main()
