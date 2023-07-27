# sel4.v

このVerilogコードは、4つの入力（din[3:0]）と2つの選択信号（sel[1:0]）を受け取り、それに基づいて1つの出力（dout）を生成する4-to-1マルチプレクサ（MUX）を定義しています。

- `sel4.v`モジュール:
  - `input [3:0] din;`: 4ビットの入力信号dinを受け取ります。
  - `input [1:0] sel;`: 2ビットの選択信号selを受け取ります。
  - `output dout;`: 1ビットの出力信号doutを生成します。

  - `function select;`: selectという関数を定義します。
    - 関数内部で、入力信号selの値に基づいて、どの入力信号を選択するかを判断します。
    - sel[1:0]の値に応じて、din[3:0]のうちどのビットを出力信号doutに選択するかを決定します。

  - `assign dout=select(din,sel);`: 関数selectに入力信号dinとselを渡し、結果を出力信号doutに割り当てます。

- `sel4_tp.v`モジュール:
  - `timescale 1ps/1ps`: シミュレーションのタイムスケールを1ピコ秒（1ps）に設定します。

  - `module sel4to1_if_tp;`: トップレベルモジュールを定義します。
    - `reg [3:0] din;`: 4ビットの入力信号dinを表すレジスタを宣言します。
    - `reg [1:0] sel;`: 2ビットの選択信号selを表すレジスタを宣言します。
    - `wire dout;`: 1ビットの出力信号doutを表すワイヤを宣言します。

    - `parameter STEP = 1000;`: ステップとして使用する定数を定義します。この値はシミュレーション中のタイミングを制御します。

    - `sel4to1_if sel4to1_if(din, sel, dout);`: `sel4.v`モジュールをインスタンス化し、入力と出力を接続します。

    - `initial begin`: 初期化ブロックを開始します。
      - `sel[1]=1'b0; sel[0]=1'b0; din[3]=1'b0; din[2]=1'b0; din[1]=1'b0; din[0]=1'b1;`: 初期値を設定します。
      - `#STEP`: ステップごとにシミュレーションを実行します。
      - `$finish;`: シミュレーションを終了します。

    - `initial $monitor( $stime, " sel=%h din=%b dout=%b ", sel, din, dout);`: `$monitor`タスクを使用して、シミュレーションの進行状況を監視します。シミュレーションの各ステップで、選択信号（sel）、入力信号（din）、および出力信号（dout）の値を表示します。

このシミュレーションは、`sel4to1_if_tp`モジュール内の初期化ブロックで設定された入力値と選択信号を用いて、4-to-1マルチプレクサの動作をシミュレーションします。各ステップごとに選択信号に基づいて入力信号の特定のビットが出力信号doutに選択され、その値が表示されます。最終的にシミュレーションは`$finish`タスクで終了します。

~~~v
         0 sel=0 din=0001 dout=1 
      1000 sel=1 din=0001 dout=0
      2000 sel=2 din=0001 dout=0
      3000 sel=3 din=0001 dout=0
      4000 sel=0 din=0010 dout=0
      5000 sel=1 din=0010 dout=1
      6000 sel=2 din=0010 dout=0
      7000 sel=3 din=0010 dout=0
      8000 sel=0 din=0100 dout=0
      9000 sel=1 din=0100 dout=0
     10000 sel=2 din=0100 dout=1
     11000 sel=3 din=0100 dout=0
     12000 sel=0 din=1000 dout=0
     13000 sel=1 din=1000 dout=0
     14000 sel=2 din=1000 dout=0
     15000 sel=3 din=1000 dout=1 // <- sel = 3 なのでdinの3番目の値が1の時、dout = 1
~~~
