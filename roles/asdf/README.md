# roles/asdf
asdf-vm/asdf: Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more



## Dependencies
- homebrew



## Usage
e.g. awscli

```
% asdf plugin list all | grep aws
aws-copilot                   https://github.com/NeoHsu/asdf-copilot
aws-iam-authenticator         https://github.com/stefansedich/asdf-aws-iam-authenticator.git
aws-nuke                      https://github.com/bersalazar/asdf-aws-nuke.git
aws-sam-cli                   https://github.com/amrox/asdf-pyapp.git
aws-vault                     https://github.com/karancode/asdf-aws-vault.git
awscli                       *https://github.com/MetricMike/asdf-awscli.git
awsebcli                      https://github.com/amrox/asdf-pyapp.git
saml2aws                      https://github.com/elementalvoid/asdf-saml2aws.git

% asdf plugin add awscli
% asdf install awscli latest
% asdf global awscli latest
```


### その他のコマンド
```
# プラグインがインストールされていない場合
% asdf list awscli; echo $?
No such plugin: golang
1

# プラグインがインストール済みだが、ランタイムはインストールされていない場合
% asdf list awscli; echo $?
  No versions installed
0

# プラグインがインストール済みで、ランタイムもインストールされている場合
% asdf list awscli; echo $?
  2.6.1
0

# プラグインが提供するバージョン一覧を表示
% asdf list all awscli | tail
2.5.1
2.5.2
2.5.3
2.5.4
2.5.5
2.5.6
2.5.7
2.5.8
2.6.0
2.6.1

# バージョンを指定してインストールする
asdf install awscli 2.6.0
awscli 2.6.0 installation was successful!

# プラグインを Update する
% asdf plugin update awscli
Updating awscli to main
Already on 'main'
Your branch is up to date with 'origin/main'.

# カレントバージョンを表示する
% asdf current awscli
awscli          2.6.1           /Users/xxxxx/.tool-versions
```



## References
- [asdf-vm/asdf: Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more](https://github.com/asdf-vm/asdf)
- [バージョン管理ツール「asdf」を使ってみる | 働くひとと組織の健康を創る iCARE](https://dev.icare.jpn.com/dev_cat/how_to_use_asdf/)

