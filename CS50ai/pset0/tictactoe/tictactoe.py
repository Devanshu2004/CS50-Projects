"""
Tic Tac Toe Player
"""

import math
import copy

X = "X"
O = "O"
EMPTY = None


def initial_state():
    """
    Returns starting state of the board.
    """
    return [[EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY]]


def player(board):
    """
    Returns player who has the next turn on a board.
    """
    no_of_x = 0
    no_of_o = 0
    no_of_emp = 0

    # Checking the number of moves by each player on board in that state
    for row in range(len(board)):
        for col in range(len(board[row])):
            if board[row][col] == X:
                no_of_x += 1
            elif board[row][col] == O:
                no_of_o += 1
            elif board[row][col] is None:
                no_of_emp += 1

    # Return the player whose turn it is
    # Starting with X's turn
    if no_of_emp == "9":
        return X
    else:
        if no_of_x > no_of_o:
            return O
        else:
            return X

def actions(board):
    """
    Returns set of all possible actions (i, j) available on the board.
    """

    # Creating an empty list for counting number of possible moves
    possible_moves = []

    # Searching for total possible moves on the board at the state
    for i in range(len(board)):
        for j in range(len(board[i])):
            if board[i][j] is None:
                possible_moves.append((i, j))

    # Returning the final list of possible moves
    return possible_moves


def result(board, action):
    """
    Returns the board that results from making move (i, j) on the board.
    """
    if action not in actions(board):
        raise Exception("Not a valid action")

    i, j = action
    board_copy = copy.deepcopy(board)
    board_copy[i][j] = player(board)
    return board_copy

def winner(board):
    """
    Returns the winner of the game, if there is one.
    """
    x_counter = 0
    o_counter = 0

    for i in range(len(board)):
        for j in range(len(board[i])):

            # Checking whether "X" is the winner
            if board[i][0] is None or board[i][1] is None or board[i][2] is None:
                try:
                    if X in board[0][j]:
                        if X in board[1][j]:
                            if X in board[2][j]:
                                x_counter = 3
                except TypeError:
                    pass
            else:
                if X in board[i][0] and X in board[i][1] and X in board[i][2]:
                    x_counter += 1
            try:
                if X in board[0][0] and X in board[1][1] and X in board[2][2]:
                    x_counter = 3
            except TypeError:
                pass
            try:
                if X in board[0][2] and X in board[1][1] and X in board[2][0]:
                    x_counter = 3
            except TypeError:
                pass

            # Checking whether "O" is the winner
            if board[i][0] is None or board[i][1] is None or board[i][2] is None:
                try:
                    if O in board[0][j]:
                        if O in board[1][j]:
                            if O in board[2][j]:
                                o_counter = 3
                except TypeError:
                    pass
            else:
                if O in board[i][0] and O in board[i][1] and O in board[i][2]:
                    o_counter += 1
            try:
                if O in board[0][0] and O in board[1][1] and O in board[2][2]:
                    o_counter = 3
            except TypeError:
                pass
            try:
                if O in board[0][2] and O in board[1][1] and O in board[2][0]:
                    o_counter = 3
            except TypeError:
                pass

    if x_counter == 3:
        return X
    elif o_counter == 3:
        return O
    else:
        return None


def terminal(board):
    """
    Returns True if game is over, False otherwise.
    """
    # Checking the winner state at that moment
    x = winner(board)

    # If there is a winner then terminal will return True
    if x is not None:
        return True
    else:
        empty_space_counter = 9
        for i in range(len(board)):
            for j in range(len(board[i])):
                if board[i][j] is not None:
                    empty_space_counter -= 1

        # Checking whether all the boxes are filled
        if empty_space_counter == 0:
            return True
        else:
            return False

def utility(board):
    """
    Returns 1 if X has won the game, -1 if O has won, 0 otherwise.
    """
    if winner(board) == X:
        return 1
    elif winner(board) == O:
        return -1
    else:
        return 0

def max_value(board):
    v = -math.inf
    if terminal(board):
        return utility(board)
    for action in actions(board):
        v = max(v, min_value(result(board, action)))
        return v

def min_value(board):
    v = math.inf
    if terminal(board):
        return utility(board)
    for action in actions(board):
        v = min(v, max_value(result(board, action)))
        return v

def minimax(board):
    """
    Returns the optimal action for the current player on the board.
    """
    if terminal(board):
        return None
    elif player(board) == X:
        moves = []
        for action in actions(board):
            moves.append([min_value(result(board, action)), action])
        return sorted(moves, key = lambda x: x[0], reverse = True)[0][1]
    elif player(board) == O:
        moves = []
        for action in actions(board):
            moves.append([max_value(result(board, action)), action])
        return sorted(moves, key = lambda x: x[0])[0][1]