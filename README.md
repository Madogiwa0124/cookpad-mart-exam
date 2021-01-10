# cookpad-mart-exam

以下のクックパッドマートエンジニア採用試験を解いてみたリポジトリ

https://cookpad-mart-careers.studio.site/engineer

実行環境

``` sh
$ ruby -v
ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-darwin18]
```

# Q1

> 大きさは同じで重さが異なる商品が複数あるとします。この商品N個を、以下の条件にそって3つのトラックに分配するアルゴリズムを実装してください。

``` sh
$ ruby exam_1/main.rb 1:50 2:30 3:40 4:10
truck_1:1
truck_2:2,4
truck_3:3
```

# Q2

> 任意の数のモンスターがいます。APIサーバーにそのうちの2匹を指定すると、対戦をさせた結果を得ることができます。モンスターの強さは決まっていて、同じモンスター同士であれば、対戦の結果は常に変わりません。また、三すくみのような状態は考えないものとします。このAPIサーバーをつかって、モンスターを強い順に並べてください。

``` sh
$ ruby exam_2/main.rb griffin vampire dragon troll medusa
==== RESULT ====
No.1: troll
No.2: dragon
No.3: medusa
No.4: griffin
No.5: vampire
```
