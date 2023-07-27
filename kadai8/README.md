# 電子錠

上記のコードは、4桁の暗証番号を入力して、正しい暗証番号が入力された場合に電子錠を解錠する電子錠（elelock3）モジュールです。また、それをテストするためのテストベンチ（elelock3_tp）も含まれています。

以下、モジュール`elelock3.v`の動作について説明します：

- モジュール`elelock3`:
  - 入力ポート: `ck`, `reset`, `close`, `tenkey`
  - 出力ポート: `lock`
  - レジスタ: `lock`, `ke1`, `ke2`, `key[0:3]`, `secret_key[0:3]`
  - ワイヤ: `match`, `key_enbl`, `lock_enbl`

1. レジスタの初期化: `reset`信号が1になるか、`ck`信号の立ち上がり（posedge）でレジスタが初期化されます。`reset`が1の場合、暗証番号記憶レジスタ`secret_key`と入力暗証番号レジスタ`key`が4桁の1111で初期化されます。

2. テンキー入力のチャタリング対策: テンキーの入力`tenkey`を監視し、立ち上がりエッジでチャタリング対策を行います。`ke1`と`ke2`は、1クロック前と2クロック前の`tenkey`の立ち上がりエッジを保持します。

3. テンキー入力のエンコード: `tenkey`の値に基づいて、4ビットの暗証番号をエンコードする`keyenc`関数が使用されます。

4. 暗証番号の入力と登録: `close`信号が1になり、かつ`lock_enbl`が1になる場合に、現在の入力暗証番号が暗証番号記憶レジスタ`secret_key`に登録されます。この際、`key`レジスタには新しい暗証番号が入力されます。

5. 暗証番号の一致判定: `key`レジスタの値が`secret_key`レジスタの値と一致するかどうかを判定します。一致した場合、`match`信号が1になります。

6. 電子錠出力: `reset`信号が1の場合、`lock`信号は常に0になります。`close`信号が1になり、かつ`lock_enbl`が1になる場合、`lock`信号は1になります。`match`信号が1になると、`lock`信号は0になります。

- モジュール`elelock3_tp`（テストベンチ）:
  - 入力ポート: なし
  - 出力ポート: なし
  - 信号の生成とモジュールのインスタンス化、テストモニタの設定を行います。

以上のように、`elelock3`モジュールは電子錠を制御し、`elelock3_tp`モジュールはテストを実行してモジュールの動作を監視します。テストベンチにより、電子錠の動作と暗証番号の登録が正しく行われるかどうかを確認できます。


## 出力

~~~v
         0 reset=0 close=0 tenkey=0000000000 key=xxxx secret_key=xxxx lock=x
      1000 reset=1 close=0 tenkey=0000000000 key=ffff secret_key=ffff lock=0
      1500 reset=1 close=0 tenkey=0000000000 key=ffff secret_key=ffff lock=0
      2000 reset=0 close=0 tenkey=0000000000 key=ffff secret_key=ffff lock=0
      6000 reset=0 close=0 tenkey=0000000010 key=ffff secret_key=ffff lock=0
      7500 reset=0 close=0 tenkey=0000000010 key=fff1 secret_key=ffff lock=0
     10000 reset=0 close=0 tenkey=0000000000 key=fff1 secret_key=ffff lock=0
     14000 reset=0 close=0 tenkey=0000000100 key=fff1 secret_key=ffff lock=0
     15500 reset=0 close=0 tenkey=0000000100 key=ff12 secret_key=ffff lock=0
     18000 reset=0 close=0 tenkey=0000000000 key=ff12 secret_key=ffff lock=0
     22000 reset=0 close=0 tenkey=0000001000 key=ff12 secret_key=ffff lock=0
     23500 reset=0 close=0 tenkey=0000001000 key=f123 secret_key=ffff lock=0
     26000 reset=0 close=0 tenkey=0000000000 key=f123 secret_key=ffff lock=0
     30000 reset=0 close=0 tenkey=0000010000 key=f123 secret_key=ffff lock=0
     31500 reset=0 close=0 tenkey=0000010000 key=1234 secret_key=ffff lock=0
     34000 reset=0 close=0 tenkey=0000000000 key=1234 secret_key=ffff lock=0
     38000 reset=0 close=1 tenkey=0000000000 key=1234 secret_key=ffff lock=0
     38500 reset=0 close=1 tenkey=0000000000 key=ffff secret_key=1234 lock=1
     39000 reset=0 close=0 tenkey=0000000000 key=ffff secret_key=1234 lock=1
     43000 reset=0 close=0 tenkey=0000100000 key=ffff secret_key=1234 lock=1
     44500 reset=0 close=0 tenkey=0000100000 key=fff5 secret_key=1234 lock=1
     47000 reset=0 close=0 tenkey=0000000000 key=fff5 secret_key=1234 lock=1
     51000 reset=0 close=0 tenkey=0000000010 key=fff5 secret_key=1234 lock=1
     52500 reset=0 close=0 tenkey=0000000010 key=ff51 secret_key=1234 lock=1
     55000 reset=0 close=0 tenkey=0000000000 key=ff51 secret_key=1234 lock=1
     59000 reset=0 close=0 tenkey=0000000100 key=ff51 secret_key=1234 lock=1
     60500 reset=0 close=0 tenkey=0000000100 key=f512 secret_key=1234 lock=1
     63000 reset=0 close=0 tenkey=0000000000 key=f512 secret_key=1234 lock=1
     67000 reset=0 close=0 tenkey=0000001000 key=f512 secret_key=1234 lock=1
     68500 reset=0 close=0 tenkey=0000001000 key=5123 secret_key=1234 lock=1
     71000 reset=0 close=0 tenkey=0000000000 key=5123 secret_key=1234 lock=1
     75000 reset=0 close=0 tenkey=0000010000 key=5123 secret_key=1234 lock=1
     76500 reset=0 close=0 tenkey=0000010000 key=1234 secret_key=1234 lock=1
     77500 reset=0 close=0 tenkey=0000010000 key=1234 secret_key=1234 lock=0
     79000 reset=0 close=0 tenkey=0000000000 key=1234 secret_key=1234 lock=0
     80000 reset=1 close=0 tenkey=0000000000 key=ffff secret_key=ffff lock=0
     80500 reset=1 close=0 tenkey=0000000000 key=ffff secret_key=ffff lock=0
     81000 reset=0 close=0 tenkey=0000000000 key=ffff secret_key=ffff lock=0
     85000 reset=0 close=0 tenkey=1000000000 key=ffff secret_key=ffff lock=0
     86500 reset=0 close=0 tenkey=1000000000 key=fff9 secret_key=ffff lock=0
     89000 reset=0 close=0 tenkey=0000000000 key=fff9 secret_key=ffff lock=0
     93000 reset=0 close=1 tenkey=0000000000 key=fff9 secret_key=ffff lock=0
     94000 reset=0 close=0 tenkey=0000000000 key=fff9 secret_key=ffff lock=0
     98000 reset=0 close=0 tenkey=1000000000 key=fff9 secret_key=ffff lock=0
     99500 reset=0 close=0 tenkey=1000000000 key=ff99 secret_key=ffff lock=0
    102000 reset=0 close=0 tenkey=0000000000 key=ff99 secret_key=ffff lock=0
~~~

この出力からわかるように、電子錠の動作がテストされています。出力の内容を順に見てみましょう：

1. 0サイクル目:
   - `reset=0`: リセット信号が0であることを示します。
   - `close=0`: 閉じる（暗証番号登録モード）信号が0であることを示します。
   - `tenkey=0000000000`: テンキーの入力が0であることを示します。
   - `key=xxxx`: 暗証番号の入力が行われていないため、`key`の値は不定です。
   - `secret_key=xxxx`: 暗証番号が登録されていないため、`secret_key`の値も不定です。
   - `lock=x`: 電子錠がロックされているかどうかを示す信号です。現在の条件ではロック状態が不定です。

2. 1000サイクル目:
   - `reset=1`: リセット信号が1になったことを示します。
   - `close=0`: 閉じる（暗証番号登録モード）信号が0であることを示します。
   - `tenkey=0000000000`: テンキーの入力が0であることを示します。
   - `key=ffff`: 4桁の暗証番号が入力されていることを示します（エンコード結果がffff）。
   - `secret_key=ffff`: 暗証番号が登録されていることを示します。
   - `lock=0`: 電子錠がロックされていないことを示します（暗証番号が登録された状態であるため）。

3. 1500サイクル目:
   - `reset=1`: リセット信号が1のままです。
   - `close=0`: 閉じる（暗証番号登録モード）信号が0のままです。
   - `tenkey=0000000000`: テンキーの入力が0のままです。
   - `key=ffff`: 4桁の暗証番号が入力されていることを示します。
   - `secret_key=ffff`: 暗証番号が登録されていることを示します。
   - `lock=0`: 電子錠がロックされていないことを示します。

... 以降、異なる入力条件で電子錠の動作がテストされていることがわかります。

最終的に、38000サイクル目から39000サイクル目までの出力で、以下のような動作が確認されます：
- 閉じる（暗証番号登録モード）信号`close`が1になったことを示します。
- テンキーの入力が0のままです。
- 既に登録されている暗証番号`1234`が入力されたことを示します（エンコード結果が`1234`）。
- 登録されている暗証番号`1234`と入力暗証番号`1234`が一致するため、電子錠が解錠（`lock=1`）されました。

以上のように、テスト結果から電子錠の動作が正しくテストされ、暗証番号の登録と解錠が適切に行われていることが確認できます。