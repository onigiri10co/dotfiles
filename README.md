# dotfiles
My dotfiles



## Installation
```
curl -fsSL https://raw.githubusercontent.com/onigomex/dotfiles/HEAD/install | zsh
```


### Another way
```
% export DOTF_ROLES_FILE=roles.work.lst
% curl -fsSL https://raw.githubusercontent.com/onigomex/dotfiles/HEAD/install | zsh
```
```
% export DOTF_ROLES_FILE=`pwd`/roles.txt
% cat << EOF > $DOTF_ROLES_FILE
fzf
git
tig
EOF
% curl -fsSL https://raw.githubusercontent.com/onigomex/dotfiles/HEAD/install | zsh
```
```
% git clone https://github.com/onigomex/dotfiles.git
% cd dotfiles
% make install
% make install ROLE=vim
```

#### $DOTF_ROLES_FILE
'#' is a comment, blank lines are ignored.

```
fzf
git

#ghq
tig
```


### NOTE: sudo password
If you make the following settings in advance, you will not be asked for sudo password.

```
sudo sh -c "echo $(whoami) ALL=\(ALL\) NOPASSWD:ALL > /private/etc/sudoers.d/$(whoami)"
```

Delete it if it is not necessary after the installation is completed.

```
sudo rm -f /private/etc/sudoers.d/$(whoami)
```



## Configuration
You can override the configuration values for particular role by setting them before installation.

### roles/git
```
export GIT_USERNAME=foo
export GIT_EMAIL=bar@baz.com
```



## Development
### Specify the branch
```
export DOTF_BRANCH="develop"
curl -fsSL https://raw.githubusercontent.com/onigomex/dotfiles/$DOTF_BRANCH/install | zsh
```


### Create ROLE
```
make create ROLE=vim
```

1. Define the dependent role names on the `roles/<ROLE>/dependencies` file. If does not exist, empty it or delete it.
1. Implement `roles/<ROLE>/install.sh` file.
1. If you want to define environment variables, define it in the `roles/<ROLE>/.zsh.d/<ROLE>.zshrc.env` file.
1. If you want to define alias, define it in the `roles/<ROLE>/.zsh.d/<ROLE>.zshrc.alias` file.
1. If you want to define other processes, define it in the `roles/<ROLE>/.zsh.d/<ROLE>.zshrc` file.

