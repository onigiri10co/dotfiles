# roles/python
[Python](https://github.com/python/)



## python 開発環境
- バージョン管理: pyenv
- ツール管理: pipx
- パッケージ管理: poetry


### [pyenv/pyenv: Simple Python version management](https://github.com/pyenv/pyenv#basic-github-checkout)
- Python のバージョン管理ツール。
- 任意のバージョンをインストールでき、それらを切り替えて使用できる。


### [pypa/pipx: Install and Run Python Applications in Isolated Environments](https://github.com/pypa/pipx)
- pipx は、pip の拡張 CLI ツールで、使い方は、pip とほぼ同じ。
- インストールしたツール毎に独立した Python 環境（バージョン、依存モジュールなど）を保持できる。
- そのため、他のツールの Python 環境や、グローバル環境を気にせずに使える。
- poetry, mkdocs など、開発モジュールとは別管理したい Python 製の CLI ツールは、この pipx で管理すればスッキリする。


### [python-poetry/poetry: Python dependency management and packaging made easy.](https://github.com/python-poetry/poetry)
- プロジェクトの作成、パッケージ管理、ビルド、PyPI へのデプロイが、このツールだけで実施できる。
- 類似ツール: Pipenv、Pyflow



## セットアップ/ Python 環境
### Install pyenv
```
% echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
% brew install pyenv
% pyenv install --list | rg '\s[0-9].*' | tail    
 3.9.7
 3.9.8
 3.9.9
 3.9.10
 3.10.0
 3.10-dev
 3.10.1
 3.10.2
 3.11.0a4
 3.11-dev
```

NOTE: README には、`eval "$(pyenv init -)"` とあるが、`eval "$(pyenv init --path)"` にしないとシステムデフォルトの Python を参照するため、こうしている。


### Install pipx
```
% export XDG_DATA_HOME=$HOME/.config
% export PIPX_HOME=$XDG_DATA_HOME/pipx
% export PIPX_BIN_DIR=$HOME/bin
% export PATH=$PIPX_BIN_DIR:$PATH
% brew install pipx
```

NOTE: `pipx ensurepath` でも良いが、~/.zshrc などに自動的に PATH が書き込まれるため、自前で制御したければ上記のように設定する。


### Install poetry
```
% pipx install poetry
% poetry config virtualenvs.in-project true 
% poetry config --list
cache-dir = "/Users/h20220224/Library/Caches/pypoetry"
experimental.new-installer = true
installer.parallel = true
virtualenvs.create = true
virtualenvs.in-project = true
virtualenvs.path = "{cache-dir}/virtualenvs"  # /Users/h20220224/Library/Caches/pypoetry/virtualenvs
% rm -rf /Users/h20220224/Library/Caches/pypoetry/virtualenvs
```

virtualenvs.in-project = true: poetry が作成する仮想環境（.venv フォルダ）をプロジェクト直下に作成する。
デフォルトは、virtualenvs.path 直下に作成される。わかり易さと、VSCode の PATH 対応のため、上記に変更する。
virtualenvs.in-project = true に設定しても、既に virtualenvs.path 配下に仮想環境が作成されていた場合はそれを参照するためディレクトリごと削除する。



## セットアップ/ 開発環境
```
% pyenv install 3.10.2
% poetry new example; cd $_;
Created package example in example
% pyenv local 3.10.2
% python -V
Python 3.10.2
% poetry add flake8 mypy black isort -D
```


### サンプルプログラム
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

% poetry run python example/fizzbuzz.py
```

NOTE: vim からは、:QuickRun poetry で実行できる。


### サンプルプログラムテスト
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

% poetry run pytest tests/test_fizzbuzz.py
```


NOTE: vim からは、:QuickRun poetry/pytest or \<Leader-r\> で実行できる。 Python 周りの vim の設定は、以下の PR を参照。

- [add efm langserver with python settings by onigiri10co · Pull Request #19 · onigiri10co/dotfiles](https://github.com/onigiri10co/dotfiles/pull/19)

