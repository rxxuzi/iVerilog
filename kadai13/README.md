以下は、Verilogにおける各種カウンタの詳細な説明である。各カウンタの特徴と基本的なコードの構造について説明する。

### 5.3.1 バイナリカウンタ

バイナリカウンタは、最も基本的なカウンタで、2進数でカウントを行う。同期リセット型のバイナリカウンタは、リセット信号が同期的に動作する。以下は、基本的なコードの一例である。

```verilog
module binary_counter (
    input ck,
    input res,
    output [3:0] q
);
    always @(posedge ck or posedge res) begin
        if (res) q <= 4'b0000;
        else q <= q + 1;
    end
endmodule
```

### 5.3.2 アップ/ダウンカウンタ

アップ/ダウンカウンタは、カウント方向を制御できる。`down`信号によってカウントアップとカウントダウンを切り替えます。

```verilog
module up_down_counter (
    input ck,
    input res,
    input down,
    output [3:0] q
);
    always @(posedge ck or posedge res) begin
        if (res) q <= 4'b0000;
        else q <= down ? q-1 : q+1;
    end
endmodule
```

### 5.3.3 グレイコードカウンタ

グレイコードカウンタは、連続したカウント値が1ビットだけ異なる特性を持つ。通信やロータリーエンコーダで利用されます。

```verilog
module gray_counter (
    input ck,
    input res,
    output [3:0] q
);
    reg [3:0] binary_count;
    always @(posedge ck or posedge res) begin
        if (res) binary_count <= 4'b0000;
        else binary_count <= binary_count + 1;
    end
    assign q = binary_count ^ (binary_count >> 1);
endmodule
```

### 5.3.4 手抜きグレイコードカウンタ

バイナリからグレイコードへの変換を単純な排他的論理和(EX-OR)で行う。

```verilog
assign q = binary_count ^ (binary_count >> 1);
```

### 5.3.5 ジョンソンカウンタ

ジョンソンカウンタは、特定のビットパターンをシフトして循環させるカウンタである。

```verilog
module johnson_counter (
    input ck,
    input res,
    output [3:0] q
);
    always @(posedge ck or posedge res) begin
        if (res) q <= 4'b0001;
        else q <= {q[2:0], ~q[3]};
    end
endmodule
```

### 5.3.6 不正ループ対策版ジョンソンカウンタ

不正ループを防ぐためのロジックを追加したジョンソンカウンタである。具体的なコードは、具体的な対策方法に依存する。

### 5.3.7 リングカウンタ

リングカウンタは、1のビットがリングのように循環するカウンタである。

```verilog
module ring_counter (
    input ck,
    input res,
    output [2:0] q
);
    reg [2:0] ff;
    always @(posedge ck or posedge res) begin
        if (res) ff <= 3'b001;
        else ff <= {ff[0], ff[2:1]};
    end
    assign q = ff;
endmodule
```

### 5.3.8 ディバイダ（分周回路）

ディバイダは、クロック信号を分周する回路である。

```verilog
module divider (
    input ck,
    input res,
    output q
);
    reg [3:0] count;
    always @(posedge ck or posedge res) begin
        if (res) count <= 4'b0000;
        else count <= count + 1;
    end
    assign q = count[3];
endmodule
```
