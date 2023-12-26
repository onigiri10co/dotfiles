# roles/ruby



## Dependencies
- asdf



## Setup
### Plugin
```
% asdf plugin list all | grep ruby            
ruby                         *https://github.com/asdf-vm/asdf-ruby.git
% asdf plugin add ruby
% asdf install ruby latest
% asdf global ruby latest
```


### Any version
```
% asdf list ruby
  3.1.2
% asdf list all ruby | grep ^\[0-9\]\.\* | tail
3.0.2
3.0.3
3.0.4
3.1.0-dev
3.1.0-preview1
3.1.0
3.1.1
3.1.2
3.2.0-dev
3.2.0-preview1
% asdf install ruby 3.0.2
% asdf list ruby
  3.0.2
  3.1.2
% asdf current ruby
ruby            3.1.2           /Users/h20220530/.tool-versions
% asdf shell ruby 3.0.2
% asdf current ruby
ruby            3.0.2           ASDF_RUBY_VERSION environment variable
% ruby --version
ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [arm64-darwin20]
% asdf shell ruby --unset
% ruby --version
ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [arm64-darwin20]
```



## References
- [オブジェクト指向スクリプト言語 Ruby](https://www.ruby-lang.org/ja/)
- [asdf-vm/asdf-ruby: Ruby plugin for asdf version manager](https://github.com/asdf-vm/asdf-ruby)

