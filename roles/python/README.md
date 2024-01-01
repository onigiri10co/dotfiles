# roles/python
Python Programming language



## Dependencies
- asdf



## Examples
### Example program
```
% cat << EOF > example/fizzbuzz.py
def main():
    for i in range(1, 101):
        print(fizz_buzz(i))

def fizz_buzz(num: int) -> str:
    if num % 3 == 0 and num % 5 == 0:
        return "FizzBuzz"
    elif num % 3 == 0:
        return "Fizz"
    elif num % 5 == 0:
        return "Buzz"
    else:
        return str(num)

if __name__ == "__main__":
    main()

EOF

% python example/fizzbuzz.py
% poetry run python example/fizzbuzz.py
```

NOTE: vim からは、:QuickRun poetry で実行できる。


### Example test
```
cat << EOF > tests/test_fizzbuzz.py
def test_fizz_buzz():
    from example.fizzbuzz import fizz_buzz

    assert fizz_buzz(1) == "1"
    assert fizz_buzz(2) == "2"
    assert fizz_buzz(3) == "Fizz"
    assert fizz_buzz(4) == "4"
    assert fizz_buzz(5) == "Buzz"
    assert fizz_buzz(10) == "Buzz"
    assert fizz_buzz(15) == "FizzBuzz"
    assert fizz_buzz(75) == "FizzBuzz"
    assert fizz_buzz(83) == "83"
    assert fizz_buzz(99) == "Fizz"
    assert fizz_buzz(100) == "Buzz"

EOF

% pip install pytest
% pytest tests/test_fizzbuzz.py
% poetry run pytest tests/test_fizzbuzz.py
```


NOTE: vim からは、:QuickRun poetry/pytest or \<Leader-r\> で実行できる。 Python 周りの vim の設定は、以下の PR を参照。

- [add efm langserver with python settings by onigomex · Pull Request #19 · onigomex/dotfiles](https://github.com/onigomex/dotfiles/pull/19)



## References
- [Python](https://github.com/python/)

