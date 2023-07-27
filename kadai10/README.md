# まとめ

## decoder

$din = n $の時に、 `dout`をn桁数目だけ1にして返す

~~~v
din = 0 dout = 0001
din = 1 dout = 0010
din = 2 dout = 0100
~~~

## encoder

$din = n (2b) $
dinの上位ビットから順に調べて最初に1になった位置を見つけ、その位置に対応するエンコード値をdoutに出力する。
たとえば、`din = 00110011`の場合、3番目のビットが最初に1になっているため、doutには3ビットの値`010`が出力されます。同様に、`din = 11000000`の場合、最上位ビットが1になっているため、doutには3ビットの値「111」が出力されることになる。

## selector 

4つの入力（din[3:0]）と2つの選択信号（sel[1:0]）を受け取り、それに基づいて1つの出力（dout）を生成する4-to-1マルチプレクサ（MUX）を定義する
