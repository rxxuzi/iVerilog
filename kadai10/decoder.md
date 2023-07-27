# decoder

このVerilogコードは、2ビットの入力信号（din）を持ち、4ビットの出力信号（dout）を生成する2-to-4デコーダを定義しています。

- `decoder.v`モジュール:
  - `input [1:0] din;`: 2ビットの入力信号dinを受け取ります。
  - `output [3:0] dout;`: 4ビットの出力信号doutを生成します。

  - 2-to-4デコーダの動作を記述しています。
    - `assign dout[0] = (din==2'b00);`: 入力信号dinが2'b00（2進数の0）の場合、出力信号dout[0]を1にします。それ以外の場合、dout[0]は0になります。
    - `assign dout[1] = (din==2'b01);`: 入力信号dinが2'b01（2進数の1）の場合、出力信号dout[1]を1にします。それ以外の場合、dout[1]は0になります。
    - `assign dout[2] = (din==2'b10);`: 入力信号dinが2'b10（2進数の2）の場合、出力信号dout[2]を1にします。それ以外の場合、dout[2]は0になります。
    - `assign dout[3] = (din==2'b11);`: 入力信号dinが2'b11（2進数の3）の場合、出力信号dout[3]を1にします。それ以外の場合、dout[3]は0になります。

  つまり、2-to-4デコーダは入力信号dinの値に応じて、対応する出力ビットdoutを1にし、他の出力ビットを0にします。

- `decoder_tp.v`モジュール:
  - `timescale 1ps/1ps`: シミュレーションのタイムスケールを1ピコ秒（1ps）に設定します。

  - `module decoder_cond_tp;`: トップレベルモジュールを定義します。
    - `reg [1:0] din;`: 2ビットの入力信号dinを表すレジスタを宣言します。
    - `wire [3:0] dout;`: 4ビットの出力信号doutを表すワイヤを宣言します。

    - `parameter STEP = 1000;`: ステップとして使用する定数を定義します。この値はシミュレーション中のタイミングを制御します。

    - `decoder_cond decoder_cond(din, dout);`: `decoder.v`モジュールをインスタンス化し、入力と出力を接続します。

    - `initial begin`: 初期化ブロックを開始します。
      - `din[1]=0; din[0]=0;`: 初期値を設定します。
      - `#STEP`: ステップごとにシミュレーションを実行します。
      - `$finish;`: シミュレーションを終了します。

    - `initial $monitor( $stime, " din=%h dout=%b ", din, dout);`: `$monitor`タスクを使用して、シミュレーションの進行状況を監視します。シミュレーションの各ステップで、入力信号dinと出力信号doutの値を表示します。

このシミュレーションでは、`decoder_cond_tp`モジュール内の初期化ブロックで設定された入力値に基づいて2-to-4デコーダの動作をシミュレーションしています。各ステップごとに入力信号dinが変化し、それに対応する出力信号doutのビットが1になるかどうかが確認されます。最終的にシミュレーションは`$finish`タスクで終了します。

~~~v
         0 din=0 dout=0001 
      1000 din=1 dout=0010
      2000 din=2 dout=0100
      3000 din=3 dout=1000
~~~