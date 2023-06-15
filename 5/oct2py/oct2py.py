from oct2py import Oct2Py

# Octaveインスタンスを作成
octave = Oct2Py()

# .mファイルの実行
octave.source("path/to/file.m")

# .mファイル内の関数の呼び出し
result = octave.function_name(arguments)

# 結果の表示
print(result)

# Octaveインスタンスのクローズ
octave.exit()