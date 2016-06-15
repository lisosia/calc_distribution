#### when to use
when you can get and-search hit numbers

|search query| hit number|
|--|--|
|a  |12|
|b  |32|
|a&b|4|

#### how to use

###### input

```
2
1* 12
*1 32
11 4
00 0
```

###### output

```
00 0
01 28
10 8
11 4
```

#### example

```
cat input_opendata | ./c.rb
```

```
cat input_opendata | ./c.rb | grep -E "0*10*<<tab>>"
```
input `<<tab>>` by [ctrl-v  tab] in shell
