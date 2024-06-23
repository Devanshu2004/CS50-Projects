from bank import value

def test_value():
    assert value("hello") == 0
    assert value("hi") == 20
    assert value("welcome") == 100

    assert value("Hello") == 0
    assert value("Hi") == 20
    assert value("Welcome") == 100