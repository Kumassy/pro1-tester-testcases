# pro1-tester-testcases
Testcase for pro1-tester

# Overview
pro1-testerを使うには`testcase.yml`を書く必要がありますが、こちらでデフォルトのテストケースを共有しています。

# How to use...
```
git clone https://github.com/Kumassy/pro1-tester-testcases
```

pro1-testerの使い方自体はこちらを参照してください：
https://github.com/Kumassy/pro1-tester

# Writing `testcase.yml`
**YAML** の記法で書いていきます。
基本的に雰囲気で書けばOKです。

- 出力だけ見るプログラムの場合、`input`は省略可能です。
- `label`は`it`に渡すアレです。省略した場合はデフォルトのラベルが使われます。
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
