# roles/ssh



## Dependencies
- gnu-cmds



## SSH configuration
```
% tree .ssh
.ssh
├── config
├── conf.d
│   ├── aws
│   ├── github
│   └── ...
├── aws-20210101.pem
├── github-20210101.pem
├── ...
└── known_hosts

% cat ~/.ssh/config
Include conf.d/*
```



## GitHub
If you are using multiple github account, set the <YOUR_GITHUB_PRIVAE_KEY> to IdentityFile

```
Host github.com
  HostName github.com
  User git
  Port 22
  IdentityFile ~/.ssh/<YOUR_GITHUB_PRIVAE_KEY>
```



## ssh localhost
System Preferences > Sharing

- [x] Remote Login

