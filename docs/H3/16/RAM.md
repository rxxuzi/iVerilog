# VerilogによるRAMシミュレーション・モデル

## 概要
このドキュメントでは、Verilogを用いたRAM（Random Access Memory）のシミュレーションモデルについて説明する。プロジェクトは以下のファイルから構成される：

- `RAM.v`：RAMの動作をシミュレートするVerilogモジュール
- `RAM_tp.v`：`RAM` モジュールのテストベンチ
- `RAMcmd.txt`：シミュレーション実行コマンドと出力

## `RAM.v`

### 概要
`RAM.v` はRAMの動作をシミュレートするためのモジュールである。このモジュールは読み書き操作をシミュレートし、内部的にデータを配列に保存する。

### コード例
```verilog
// RAMシミュレーション

module RAM(addr, data, ceb, web, oeb);
input [14:0] addr;
inout [7:0] data;
input ceb, web, oeb;

reg [7:0] mem [0:32767];
wire WRITE, READ;

parameter WDELAY = 1000, RDELAY = 1500;

always @(WRITE or data) begin
    #WDELAY
    if (WRITE)
        mem[addr] <= data;
end

assign READ = (oeb == 0) & (ceb == 0);
assign WRITE = (web == 0) & (ceb == 0);

assign #RDELAY data = READ ? mem[addr] : 8'hzz;

endmodule
```

## `RAMcmd.txt`
`RAMcmd.txt` にはシミュレーションを実行するためのコマンドとその出力が記録されている。これにより、シミュレーションの進行状況と `addr`, `ceb`, `web`, `oeb`, `data` の値

の変化が確認できる。

このプロジェクト全体は、Verilogを用いたハードウェアシミュレーションの一例であり、RAMの読み書き操作を模擬している。このモデルは、RAMの基本的な動作原理を理解するのに役立つ。