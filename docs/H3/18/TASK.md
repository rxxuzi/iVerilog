# Verilogにおけるタスクの使用

## CPUによるRead/Writeモデル

CPUによる内部レジスタへの読み書き操作をモデル化する際に、タスクを利用することができる。このモデルでは、タスクはRead/Write操作を実行し、戻り値としてデータを返すことができる。タスクはプログラム言語の関数に相当し、再利用可能な機能のモジュール化を可能にする。

## 各種タスク・テクニック

- **文字列引数の使用**: タスクに文字列引数を渡すことが可能。これにより、例えばファイル名の指定などが行える。
- **ファイルの末尾チェック**: ファイルの読み込み時に末尾をチェックすることで、適切な処理を行うことが可能。

### 文字列引数の使用方法

文字列はVerilogでは1バイトの文字を8ビットのベクトルとして扱い、これらを多ビット信号として表現する。例えば、80文字までの文字列は `input [80*8-1:0]` として宣言できる。文字列の連接演算子 `{}` を使用することで、文字列を結合することが可能である。

### サンプルコード

```verilog
module task_with_string_arg;
    reg [7:0] mem [0:255];
    task read_file_all;
        input [80*8-1:0] filename;
        begin
            $readmemh(filename, mem);
        end
    endtask

    initial begin
        parameter [80*8-1:0] in_filename = "chk_data/sample";
        read_file_all({in_filename, ".hex"}); // 拡張子を付加してファイルを読み込む
    end
endmodule
```

このコードでは、`read_file_all` タスクが文字列引数 `filename` を受け取り、`$readmemh` システム・タスクを使って外部ファイルからデータを読み込む処理を行っている。

### ファイルの末尾チェック

ファイルの末尾に到達したかどうかをチェックするには、`infile[i] === 8'hxx` のような条件を使用する。`===` 演算子は、不定値（`x`）も含めて一致するかどうかをチェックするため、ファイルの末尾または不定のデータを正確に検出することができる。

```verilog
if(infile[i] === 8'hxx`)
```

### break, continue の実現

Verilogでは、`break` と `continue` の概念を `disable` ステートメントを用いて実現する。`begin: LABEL` と `end` ブロックで囲むことで、`for` ループなどの制御構造内で `disable LABEL;` を用いることで `break` や `continue` を実現できる。

```verilog
// ループ中でのbreak, continueの実現
integer i;
begin: loop_label
    for (i = 0; i < 10; i = i + 1) begin
        if (i == 5) begin
            disable loop_label; // breakの実現
        end
    end
end
```

## まとめ

これらのタスクの使用により、Verilogでのシミュレーション記述は柔軟かつ効率的になり、より複雑な動作のモデリングが可能になる。特に、タスクを用いたCPUのRead/Writeモデルや、ループ制御のテクニックは、シミュレーションの記述を簡素化し、再利用可能なモジュールを作成する際に非常に有用である。
