import re
import json

def cleaning(s):
  if s == '生':
    return '切る'
  elif s == '皮あり':
    return '皮'
  elif s == 'ゆで':
    return '茹でる'
  elif s == '焼き':
    return '焼く'
  elif s == 'フライ済み':
    return '揚げる'
  elif s == '皮なし':
    return ''
  elif s == '冷凍':
    return ''
  elif s == 'にわとり':
    return 'とり'
  elif s == '粉':
    return ''
  elif s == '脂身つき':
    return '脂身'
  elif s == '加工品':
    return ''
  elif s == '養殖':
    return ''
  elif s == '天然':
    return ''
  elif s == 'だいず':
    return ''
  elif s == 'こむぎ':
    return ''
  elif s == 'こめ':
    return ''
  elif s.find('煮') >= 0:
    return '煮る'
  else:
    return s

def make_seeds_from_csv():
  with open("seeds.rb", "w", encoding='utf-8') as outp:
    outp.write("Food.create!([\n")
    lines = open("seibun.csv", "r").readlines()[1:]
    nutrients = "calorie,water,protein,fat,cholesterol,carb,fiber,ash".split(',')
    for i, l in enumerate(lines):
      category, food_id, food_name, calorie, water, protein, fat, cholesterol, carb, fiber, ash = [_ if _ != '' else 0 for _ in l.strip().split(',')]
      food_info = [cleaning(_) for _ in [re.sub("(（.+）)?(＜.+＞)?(［.+］)?", '', _) for _ in food_name.split("　")] if cleaning(_) != '']
      if "フライ用" in food_info:
        continue
      else:
        step = None
        option = None
        leather = False
        steps = ['煮る', '切る', '焼く', '揚げる', '茹でる']
        for _ in food_info:
          if _ in steps:
            step = _
          if _ == '皮つき':
            leather = True
        if step is not None:
          food_info.remove(step)
        if leather:
          food_info.remove('皮つき')
        if len(food_info) == 0:
          continue
        food_name = food_info[0]
        option = food_info[1:]
        d = "\"id\": {}, \"name\": \"{}\", \"cost\": 100, \"step_id\": {}, \"calorie\": {}, \"water\": {}, \"protein\": {}, \"fat\": {}, \"cholesterol\": {}, \"carb\": {}, \"fiber\": {}, \"ash\": {}, \"option\": \"{}\", \"leather\": {} ".format(i, food_name, steps.index(step)+1 if step is not None else 0, float(calorie), float(water), float(protein), float(fat), float(cholesterol), float(carb), float(fiber), float(ash), ",".join(option), "true" if leather else "false" )
        outp.write("  {"+d+"},\n")
    outp.write("])")
make_seeds_from_csv()
