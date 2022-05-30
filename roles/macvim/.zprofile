# NOTE:
# 基本的に ~/.zshrc に全て定義しており、~/.zprofile は使用しない方針であったが、以下の対応で必要になったので、MacVim スペシャル対応として作成する。
# refs. https://github.com/macvim-dev/macvim/wiki/Troubleshooting#for-zsh-users
#
# 他で必要になったら、競合するため、そのときにどうするか改めて考える。
#
# 本来は、PATH だけ記載すれば良いのだが、以下の理由で色々こねくり回すのと無駄にややこしくなるので、いっそ全て source している（問題が出たら、その時改めて考える）。
# - MacVim インストール時のタイミングで、PATH を grep してしまうと、まだ完成していない PATH になってしまう
# - ~/.zsh.d/.zshrc まで考慮する必要がある
#
source ~/.zshrc
