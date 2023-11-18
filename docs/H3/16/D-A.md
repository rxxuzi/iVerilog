# VerilogによるD-A変換シミュレーション・モデル

## 概要
このドキュメントでは、Verilogを用いてデジタルからアナログへの変換（D-A変換）をシミュレートするためのプロジェクトについて説明する。プロジェクトは以下のファイルから構成される：

- `DA_block.v`：D-A変換プロセスをシミュレートするVerilogモジュール
- `DA_block_tp.v`：`DA_block` モジュールのテストベンチ
- `DA_block_cmd.txt`：シミュレーション実行コマンドと出力
- `DA_out.txt`：シミュレーション結果

## `DA_block.v`

### 概要

`DA_block.v` は、デジタル信号をアナログ信号に変換するプロセスをシミュレートするためのモジュールである。このモジュールは入力信号として `dack`（データ受け入れ確認）、`reset`（リセット）、`we`（書き込み許可）、`din`（データ入力）を受け取り、内部的にデータをメモリに保存する。

### コード例

```verilog
// D-A変換シミュレーション・モデル

module DA_block(dack, reset, we, din);
input dack, reset, we;
input [7:0] din;

parameter LINENUM = 910;
reg [9:0] addr;
reg [7:0] mem[0:LINENUM-1];
reg outflag;
integer i, mcd;

always @(posedge dack) begin
    if (reset)
        addr <= 0;
    else if (we) begin 
        mem[addr] <= din;
        addr <= addr + 1;
    end
end

initial begin
    outflag = 0;
    wait(outflag);
    mcd = $fopen("DA_out.txt");
    for (i = 0; i < LINENUM; i = i + 1)
        $fdisplay(mcd, "%d", mem[i]);
    
    $fclose(mcd);
end

endmodule
```

## `DA_block_cmd.txt` と `DA_out.txt`

`DA_block_cmd.txt` にはシミュレーションを実行するためのコマンドとその出力が記録されている。これにより、シミュレーションの進行状況と `din` の値の変化が確認できる。`DA_out.txt` はシミュレーションの結果が記録されたファイルで、`DA_block` モジュールによって処理されたデータが保存されている。
