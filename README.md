# dotfiles
onigri10co's dotfiles



## Installation
```
% curl -fsSL https://raw.githubusercontent.com/onigiri10co/dotfiles/HEAD/install.sh | bash

# another way
% git clone https://github.com/onigiri10co/dotfiles.git
% cd dotfiles
% make install-all

# by ROLE
% make install ROLE=vim
```



## Create ROLE
```
% make create ROLE=vim
```

1. Define the dependent role names on the `roles/<ROLE>/dependencies` file. If does not exist, empty it or delete it.
1. Implement `roles/<ROLE>/install.sh` file.
1. If you want to define environment variables, define it in the `roles/<ROLE>/.zsh.d/<ROLE>.zshrc` file.

