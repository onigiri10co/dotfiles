# roles/node
- [nodejs/node: Node.js JavaScript runtime](https://github.com/nodejs/node)
- [asdf-vm/asdf-nodejs: Node.js plugin for asdf version manager](https://github.com/asdf-vm/asdf-nodejs)



## Setup
### Plugin
```
% asdf plugin list all | grep node
nodejs                        https://github.com/asdf-vm/asdf-nodejs.git
% asdf plugin add nodejs
% asdf install nodejs latest
% asdf global nodejs latest
```


### Any version
```
% asdf list nodejs
  18.2.0
% asdf list all nodejs | grep ^\[0-9\]\.\* | tail
17.5.0
17.6.0
17.7.0
17.7.1
17.7.2
17.8.0
17.9.0
18.0.0
18.1.0
18.2.0
% asdf install nodejs 17.5.0
% asdf list nodejs
  17.5.0
  18.2.0
% asdf current nodejs
nodejs          18.2.0          /Users/h20220530/.tool-versions
% asdf shell nodejs 17.5.0
% asdf current nodejs
nodejs          17.5.0          ASDF_NODEJS_VERSION environment variable
% node --version; npm --version
v17.5.0
8.4.1
% asdf shell nodejs --unset
% node --version; npm --version
v18.2.0
8.9.0
```

