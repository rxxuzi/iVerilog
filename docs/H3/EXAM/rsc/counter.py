import matplotlib.pyplot as plt
import numpy as np

# シミュレーションのパラメータ設定
clock_cycles = 30  # クロックサイクルの数
up_duration = 15   # カウントアップの期間（クロックサイクル数）
down_duration = 15 # カウントダウンの期間（クロックサイクル数）

# クロック信号の生成
ck = np.zeros(clock_cycles)
ck[::2] = 1

# カウンタ値の生成
q = np.zeros((4, clock_cycles), dtype=int)  # 4ビットのカウンタ値
counter_value = 0

for i in range(clock_cycles):
    if i < up_duration:
        counter_value = (counter_value + 1) % 16  # カウントアップ
    else:
        counter_value = (counter_value - 1) % 16  # カウントダウン

    # バイナリ値への変換
    for bit in range(4):
        q[bit, i] = (counter_value >> bit) & 1

# 波形のプロット
plt.figure(figsize=(12, 8))

# クロック信号のプロット
plt.subplot(5, 1, 1)
plt.step(range(clock_cycles), ck, where='post')
plt.ylabel('ck')
plt.ylim(-0.5, 1.5)

# 各ビットの状態のプロット
for bit in range(4):
    plt.subplot(5, 1, bit + 2)
    plt.step(range(clock_cycles), q[bit], where='post')
    plt.ylabel(f'q{bit}')
    plt.ylim(-0.5, 1.5)

plt.xlabel('Clock Cycles')
plt.tight_layout()
plt.show()
