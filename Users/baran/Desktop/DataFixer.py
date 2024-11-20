with open('C:\\Users\\baran\\Desktop\\Data.json', 'r', encoding='utf-8') as file:
    new_data = json.load(file)

with open('C:\\Users\\baran\\Desktop\\Data.json', 'w', encoding='utf-8') as file:
    json.dump(new_data, file, ensure_ascii=False, indent=2)
