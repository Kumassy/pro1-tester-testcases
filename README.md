# pro1-tester
BDD for Pro1

# Overview
プロ1のテストを自動化するためのスクリプトです。
テストケースはとりあえず`assignment_09-*.c`用のものが入っています。

# How to use...
**Vagrant** でも使って **CenOS** 環境で動かしましょう。
Ruby と RSpec のインストールを事前にしておきましょう。

```
git clone https://github.com/Kumassy/pro1-tester.git
cd pro1-tester
```

同じディレクトリにソースコード (*.c) を置いてください。
```
.
├── Dockerfile
├── assignment_09-a-01.c
├── assignment_09-a-02.c
├── assignment_09-a-03.c
├── assignment_09-a-04.c
├── assignment_09-a-05.c
├── assignment_09-b-01.c
├── assignment_09-b-02.c
├── assignment_09-b-03.c
├── assignment_09-b-04.c
├── assignment_09-c-01.c
├── assignment_09-c-02.c
├── assignment_09-d-01.c
├── testcase.yml
└── tester.rb
```
そして
```
rspec tester.rb --color
```
を実行するとテスト結果がでます。

# How to use(docker)
Ruby とかのインストールが面倒くさいときは Docker から実行してもよろしいかと思います。

## Docker イメージのビルド
```
cd pro1-tester
docker build -t my-ruby-image .
```

## Docker コンテナの実行
```
cd pro1-tester
docker run -it --rm -v "$PWD":/app/ -w /app/ my-ruby-image rspec tester.rb --color
```

# Writing `testcase.yml`
**YAML** の記法で書いていきます。
基本的に雰囲気で書けばOKです。

- `input`に特定の文字（`"`とか`\`とか）が含まれるときはエスケープが必要です。
- `input`の最後に改行が必要で`input`を1行で書くときは、`input`を`""`で囲って最後に`\n`をつけてください。
- 複数行の文字列を書くときには注意しましょう。

```
- expect: |
    A(65)  # ここでインデントつける
    B(66)
    C(67)
    D(68)
    E(69)

```
```
- expect: |
  A(65)  # これはシンタックスエラー
  B(66)
  C(67)
  D(68)
  E(69)

```

# 注意
- 無限ループ内で標準入力を読んでいて、`C-d`をスルーするプログラムの場合はこのスクリプトも無限ループに陥ります（OS がプロセスを強制終了する場合もあります）。
- 仕様上、標準入力に書き込んでその標準出力を見て、その結果に応じてさらに標準入力にデータを流すことはできません。標準入力にガーッと書き込んでダーッと結果を検証する感じでお願いします。
- 標準エラー出力は無視されます。
- このテストケースをパスすればあなたのプログラムが確実に正しい動作をする、ということは完全には保証できません。提出前には手動で最終確認をすることを推奨します。

# My Environment (on Vagrant)
```
cat /etc/redhat-release 
CentOS release 6.7 (Final)
```
```
ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]
```
```
rspec -v
3.4.4
```
```
gcc -v
Using built-in specs.
Target: x86_64-redhat-linux
コンフィグオプション: ../configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-bootstrap --enable-shared --enable-threads=posix --enable-checking=release --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-languages=c,c++,objc,obj-c++,java,fortran,ada --enable-java-awt=gtk --disable-dssi --with-java-home=/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre --enable-libgcj-multifile --enable-java-maintainer-mode --with-ecj-jar=/usr/share/java/eclipse-ecj.jar --disable-libjava-multilib --with-ppl --with-cloog --with-tune=generic --with-arch_32=i686 --build=x86_64-redhat-linux
スレッドモデル: posix
gcc version 4.4.7 20120313 (Red Hat 4.4.7-16) (GCC) 
```
```
docker -v
Docker version 1.7.1, build 786b29d
```

# TODO
- `Gemfile`かく
- テストケースのシンタックスみすったときのエラーをまともにする
- 無限ループするプログラムに対してのタイムアウト処理
