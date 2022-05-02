# roles/go
[golang/go: The Go programming language](https://github.com/golang/go)



## バージョン管理
Go でバージョン管理は不要らしい。
基本的に後方互換が保証されているので（たまに駄目なやつもあるらしいが）。
なので、基本的には最新を使い続けるのが良い。

バージョン固定したい場合は、公式の方法でやればいい。
Refs. [Managing Go installations - The Go Programming Language](https://golang.org/doc/manage-install#installing-multiple)


### asdf を使う場合
See [asdf/README](../asdf/README.md)

※古いバージョンで M1 mac 用(arm)のバイナリが存在しない場合、amd 用でセットアップできる。

```
% ASDF_GOLANG_OVERWRITE_ARCH=amd64 asdf install golang 1.14.1
% asdf list golang
  1.14.1
  1.18.1
% asdf local golang 1.14.1
% asdf current golang
golang          1.14.1          .tool-versions
% go version
go version go1.14.1 darwin/amd64
% cat .tool-versions 
golang 1.14.1
```

Refs. [asdf-golang/README.md at master · kennyp/asdf-golang > With ASDF_GOLANG_OVERWRITE_ARCH](https://github.com/kennyp/asdf-golang/blob/master/README.md#with-asdf_golang_overwrite_arch)

