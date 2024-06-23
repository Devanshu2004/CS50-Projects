from twttr import shorten

def test_ans():
    assert shorten("Twitter") == "Twttr"
    assert shorten("Education") == "dctn"
    assert shorten("Devanshu") == "Dvnsh"
    assert shorten("CS50p") == "CS50p"
    assert shorten("So, this is CS50!") == "S, ths s CS50!"