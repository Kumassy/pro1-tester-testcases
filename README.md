# pro1-tester-testcases
Testcase for pro1-tester

# Overview
https://github.com/Kumassy/pro1-tester 用のテストケースです。

# Usage
まずこのリポジトリを clone しましょう：

```
git clone https://github.com/Kumassy/pro1-tester-testcases.git
```

`pro1-tester` コマンドが使えるか確認します。  
そして `testcase.default.yml` があるディレクトリにソースコード `*.c` を置いて、`pro1-test` コマンドを実行すると結果が出てきます。

# About `testcase.default.yml`
こちらのリポジトリにあるのは `testcase.default.yml` です。`pro1-tester`は `testcase.default.yml` と同じディレクトリに `testcase.yml` がある場合はそちらを使用します。

自分でテストケースを書きたいときは `testcase.default.yml` をコピーして `testcase.yml` に書けばOKです。  
その状態で `testcase.default.yml` を実行したいときは  
`pro1-tester -d` (d: default) 

# Contributing
`testcase.yml` とソースコード `*.c` は `.gitignore` に登録してあるのでそのままプルリク送れます。（が、私はプルリクをマージしたことないのでこの辺りのことはあまりわかってません。。。）
