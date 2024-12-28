from collections import Counter
import re
import sys

def read_file(file_path):
    """讀取檔案內容"""
    try:
        with open(file_path, "r", encoding="utf-8") as file:
            return file.read()
    except FileNotFoundError:
        print(f"檔案 '{file_path}' 找不到，請確認檔案是否存在。")
        sys.exit(1)
    except Exception as e:
        print(f"讀取檔案時發生錯誤：{e}")
        sys.exit(1)

def find_most_common_word(text):
    """找出文字中出現次數最多的單字"""
    # 使用正則表達式分離單字，並將其轉換為小寫
    words = re.findall(r'\b\w+\b', text.lower())
    # 統計單字出現次數
    word_counts = Counter(words)
    # 找出出現次數最多的單字
    return word_counts.most_common(1)[0] if word_counts else (None, 0)

def main():
    # 設定檔案路徑
    file_path = "words.txt"
    # 讀取檔案內容
    text = read_file(file_path)
    # 找出最常見的單字及其次數
    most_common_word, count = find_most_common_word(text)
    if most_common_word:
        print(f"{count} {most_common_word}")
    else:
        print("檔案中沒有可計算的單字。")

if __name__ == "__main__":
    main()
