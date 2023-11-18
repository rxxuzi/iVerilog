# VerilogによるROMシミュレーション・モデル

## 概要
このドキュメントでは、Verilogを用いたROM（Read-Only Memory）のシミュレーションモデルについて説明する。プロジェクトは以下のファイルから構成される：

- `ROM.v`：ROMの動作をシミュレートするVerilogモジュール
- `rom_data.hex`：ROMに格納されるデータの内容
- `ROMcmd.txt`：シミュレーション実行コマンドと出力

## `ROM.v`

### 概要
`ROM.v` はROMの動作をシミュレートするためのモジュールである。このモジュールは読み取り操作をシミュレートし、内部的にデータを配列に保存する。

### コード例
```verilog
// ROMシミュレーション

module ROM(addr, data, oeb);
input [14:0] addr;
inout [7:0] data;
input oeb;

reg [7:0] mem [0:32767];

parameter RDELAY = 1500;

assign #RDELAY data = (oeb==0) ? mem[addr] : 8'hzz;

initial $readmemh("rom_data.hex", mem);

endmodule
```

## `rom_data.hex`

### 概要
`rom_data.hex` はROMモジュール内のメモリに初期化時にロードされるデータを含むファイルである。このファイルの内容は、ROMのメモリアドレスに対応するデータを定義する。

### コード例
```
0
1
2
3
4
5
6
7
8
9
10
...
```

## `ROMcmd.txt`
`ROMcmd.txt` にはシミュレーションを実行するためのコマンドとその出力が記録されている。これにより、シミュレーションの進行状況と `addr`, `oeb`, `data` の値の変化が確認できる。

このプロジェクト全体は、Verilogを用いたハードウェアシミュレーションの一例であり、ROMの読み取り操作を模擬している。このモデルは、ROMの基本的な動作原理を理解するのに役立つ。