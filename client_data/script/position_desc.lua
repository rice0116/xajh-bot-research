--官职显示脚本

--positionclass_definition部分为官职分类定义
positionclass_definition = {}

positionclass_definition[0] = {classname = "军队"}
positionclass_definition[1] = {classname = "文官"}
positionclass_definition[2] = {classname = "武官"}

--positionlevel_definition部分为官阶等级定义
    --按照官阶从低到高的顺序，0代表军队称号，从1开始为官职，1代表九品官
    --levelname  	官阶的名称，即几品官
    --salary    	官阶对应的俸禄
positionlevel_definition = {}

positionlevel_definition[0] = {levelname = "军队", salary = "无"}
positionlevel_definition[1] = {levelname = "九品", salary = "1金"}
positionlevel_definition[2] = {levelname = "八品", salary = "2金"}
positionlevel_definition[3] = {levelname = "七品", salary = "3金"}
positionlevel_definition[4] = {levelname = "六品", salary = "4金"}
positionlevel_definition[5] = {levelname = "五品", salary = "6金"}
positionlevel_definition[6] = {levelname = "从四品", salary = "8金"}
positionlevel_definition[7] = {levelname = "正四品", salary = "10金"}
positionlevel_definition[8] = {levelname = "从三品", salary = "12金"}
positionlevel_definition[9] = {levelname = "正三品", salary = "14金"}
positionlevel_definition[10] = {levelname = "二品", salary = "14金"}
positionlevel_definition[11] = {levelname = "一品", salary = "14金"}
positionlevel_definition[12] = {levelname = "正一品", salary = "14金"}

--position_definition部分为官职描述（标*表示和称号脚本中的不一样……）
    --id		官职id		！！！必须和对应的称号id一致！！！
    --note		官职名称
    --desc		官职说明
    --desc_1	官职描述1
    --desc_2	官职描述2
    --**class	官职分类
    --**level	官职对应的官阶等级
    --**sort	官职状态（"永久军职"/"永久官职"/"当前在任"）
position_definition = {}

position_definition[4101] = {class = 0 , level = 0 , sort = "永久军职" , note = "新兵" , desc = "新兵，刚被招募入伍的小卒。" , desc_1 = "" , desc_2 = ""}
position_definition[4102] = {class = 0 , level = 0 , sort = "永久军职" , note = "兵卒" , desc = "兵卒，经过一段时间训练的老兵。" , desc_1 = "" , desc_2 = ""}
position_definition[4103] = {class = 0 , level = 0 , sort = "永久军职" , note = "兵长" , desc = "兵长，带领小队士兵作战的队长。" , desc_1 = "" , desc_2 = ""}
position_definition[5101] = {class = 2 , level = 1 , sort = "永久官职" , note = "军侯" , desc = "军候，统率一曲（五百人）的武官。" , desc_1 = "" , desc_2 = ""}
position_definition[5102] = {class = 2 , level = 2 , sort = "永久官职" , note = "校尉" , desc = "校尉，略低于将军级别的武官。" , desc_1 = "" , desc_2 = ""}
position_definition[5103] = {class = 2 , level = 3 , sort = "永久官职" , note = "都尉" , desc = "都尉，掌管一郡兵马的地方军统领。" , desc_1 = "" , desc_2 = ""}
position_definition[5104] = {class = 2 , level = 4 , sort = "永久官职" , note = "裨将" , desc = "裨将，通常由校尉积累功勋升职的将军。" , desc_1 = "" , desc_2 = ""}
position_definition[5105] = {class = 2 , level = 4 , sort = "永久官职" , note = "偏将" , desc = "偏将，通常由校尉积累功勋升职的将军。" , desc_1 = "" , desc_2 = ""}
position_definition[5106] = {class = 2 , level = 5 , sort = "永久官职" , note = "鹰扬将军" , desc = "鹰扬将军，领兵将军之一。" , desc_1 = "" , desc_2 = ""}
position_definition[5107] = {class = 2 , level = 5 , sort = "永久官职" , note = "伏波将军" , desc = "伏波将军，领兵将军之一。" , desc_1 = "" , desc_2 = ""}
position_definition[5108] = {class = 2 , level = 5 , sort = "永久官职" , note = "讨虏将军" , desc = "讨虏将军，领兵将军之一。" , desc_1 = "" , desc_2 = ""}
position_definition[5109] = {class = 2 , level = 5 , sort = "永久官职" , note = "横野将军" , desc = "横野将军，领兵将军之一。" , desc_1 = "" , desc_2 = ""}
position_definition[5110] = {class = 2 , level = 7 , sort = "永久官职" , note = "羽林中郎将" , desc = "羽林中郎将，统率羽林郎的将领。" , desc_1 = "" , desc_2 = ""}
position_definition[5111] = {class = 2 , level = 7 , sort = "永久官职" , note = "虎贲中郎将" , desc = "虎贲中郎将，统率虎贲郎的将领。" , desc_1 = "" , desc_2 = ""}
position_definition[5112] = {class = 2 , level = 7 , sort = "永久官职" , note = "五官中郎将" , desc = "五官中郎将，统率五官中郎的将领。" , desc_1 = "" , desc_2 = ""}
position_definition[5113] = {class = 2 , level = 6 , sort = "永久官职" , note = "典军中郎将" , desc = "典军中郎将，领兵中郎将之一。" , desc_1 = "" , desc_2 = ""}
position_definition[5114] = {class = 2 , level = 6 , sort = "永久官职" , note = "抚军中郎将" , desc = "抚军中郎将，领兵中郎将之一。" , desc_1 = "" , desc_2 = ""}
position_definition[5115] = {class = 2 , level = 6 , sort = "永久官职" , note = "荡寇中郎将" , desc = "荡寇中郎将，领兵中郎将之一。" , desc_1 = "" , desc_2 = ""}
position_definition[5116] = {class = 2 , level = 8 , sort = "永久官职" , note = "前将军" , desc = "前将军，仅次于九卿级别，负责京师兵卫和边防屯警。" , desc_1 = "" , desc_2 = ""}
position_definition[5117] = {class = 2 , level = 8 , sort = "永久官职" , note = "后将军" , desc = "后将军，仅次于九卿级别，负责京师兵卫和边防屯警。" , desc_1 = "" , desc_2 = ""}
position_definition[5118] = {class = 2 , level = 8 , sort = "永久官职" , note = "左将军" , desc = "左将军，仅次于九卿级别，负责京师兵卫和边防屯警。" , desc_1 = "" , desc_2 = ""}
position_definition[5119] = {class = 2 , level = 8 , sort = "永久官职" , note = "右将军" , desc = "右将军，仅次于九卿级别，负责京师兵卫和边防屯警。" , desc_1 = "" , desc_2 = ""}
position_definition[5120] = {class = 2 , level = 9 , sort = "永久官职" , note = "平东将军" , desc = "平东将军，四平将军之一，主掌征伐。" , desc_1 = "" , desc_2 = ""}
position_definition[5121] = {class = 2 , level = 9 , sort = "永久官职" , note = "平南将军" , desc = "平南将军，四平将军之一，主掌征伐。" , desc_1 = "" , desc_2 = ""}
position_definition[5122] = {class = 2 , level = 9 , sort = "永久官职" , note = "平西将军" , desc = "平西将军，四平将军之一，主掌征伐。" , desc_1 = "" , desc_2 = ""}
position_definition[5123] = {class = 2 , level = 9 , sort = "永久官职" , note = "平北将军" , desc = "平北将军，四平将军之一，主掌征伐。" , desc_1 = "" , desc_2 = ""}
position_definition[5124] = {class = 2 , level = 10 , sort = "当前在任" , note = "征北将军" , desc = "征北将军，统领幽、冀、并三州军事，屯驻蓟。" , desc_1 = "" , desc_2 = ""}
position_definition[5125] = {class = 2 , level = 10 , sort = "当前在任" , note = "征西将军" , desc = "征西将军，统领雍、凉二州军事，屯驻长安。" , desc_1 = "" , desc_2 = ""}
position_definition[5126] = {class = 2 , level = 10 , sort = "当前在任" , note = "征南将军" , desc = "征南将军，统领荆、豫二州军事，屯驻新野。" , desc_1 = "" , desc_2 = ""}
position_definition[5127] = {class = 2 , level = 10 , sort = "当前在任" , note = "征东将军" , desc = "征东将军，统领青、兖、徐、扬四州军事，屯驻扬州。" , desc_1 = "" , desc_2 = ""}
position_definition[5128] = {class = 2 , level = 10 , sort = "当前在任" , note = "抚军大将军" , desc = "抚军大将军，仅次于三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5129] = {class = 2 , level = 10 , sort = "当前在任" , note = "镇军大将军" , desc = "镇军大将军，仅次于三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5130] = {class = 2 , level = 10 , sort = "当前在任" , note = "右车骑将军" , desc = "右车骑将军，蜀置，仅次于车骑将军的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5131] = {class = 2 , level = 10 , sort = "当前在任" , note = "右骠骑将军" , desc = "右骠骑将军，蜀置，仅次于骠骑将军的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5132] = {class = 2 , level = 10 , sort = "当前在任" , note = "右大将军" , desc = "右大将军，蜀置，仅次于大将军的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5133] = {class = 2 , level = 10 , sort = "当前在任" , note = "征北将军" , desc = "征北将军，统领幽、冀、并三州军事，屯驻蓟。" , desc_1 = "" , desc_2 = ""}
position_definition[5134] = {class = 2 , level = 10 , sort = "当前在任" , note = "征西将军" , desc = "征西将军，统领雍、凉二州军事，屯驻长安。" , desc_1 = "" , desc_2 = ""}
position_definition[5135] = {class = 2 , level = 10 , sort = "当前在任" , note = "征南将军" , desc = "征南将军，统领荆、豫二州军事，屯驻新野。" , desc_1 = "" , desc_2 = ""}
position_definition[5136] = {class = 2 , level = 10 , sort = "当前在任" , note = "征东将军" , desc = "征东将军，统领青、兖、徐、扬四州军事，屯驻扬州。" , desc_1 = "" , desc_2 = ""}
position_definition[5137] = {class = 2 , level = 10 , sort = "当前在任" , note = "抚军大将军" , desc = "抚军大将军，仅次于三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5138] = {class = 2 , level = 10 , sort = "当前在任" , note = "镇军大将军" , desc = "镇军大将军，仅次于三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5139] = {class = 2 , level = 10 , sort = "当前在任" , note = "辅国大将军" , desc = "辅国大将军，仅次于三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5140] = {class = 2 , level = 10 , sort = "当前在任" , note = "右都护" , desc = "右都护，吴置，统领全国半数的军队。" , desc_1 = "" , desc_2 = ""}
position_definition[5141] = {class = 2 , level = 10 , sort = "当前在任" , note = "左都护" , desc = "左都护，吴置，统领全国半数的军队。" , desc_1 = "" , desc_2 = ""}
position_definition[5142] = {class = 2 , level = 10 , sort = "当前在任" , note = "征北将军" , desc = "征北将军，统领幽、冀、并三州军事，屯驻蓟。" , desc_1 = "" , desc_2 = ""}
position_definition[5143] = {class = 2 , level = 10 , sort = "当前在任" , note = "征西将军" , desc = "征西将军，统领雍、凉二州军事，屯驻长安。" , desc_1 = "" , desc_2 = ""}
position_definition[5144] = {class = 2 , level = 10 , sort = "当前在任" , note = "征南将军" , desc = "征南将军，统领荆、豫二州军事，屯驻新野。" , desc_1 = "" , desc_2 = ""}
position_definition[5145] = {class = 2 , level = 10 , sort = "当前在任" , note = "征东将军" , desc = "征东将军，统领青、兖、徐、扬四州军事，屯驻扬州。" , desc_1 = "" , desc_2 = ""}
position_definition[5146] = {class = 2 , level = 10 , sort = "当前在任" , note = "抚军大将军" , desc = "抚军大将军，仅次于三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5147] = {class = 2 , level = 10 , sort = "当前在任" , note = "镇军大将军" , desc = "镇军大将军，仅次于三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5148] = {class = 2 , level = 10 , sort = "当前在任" , note = "辅国大将军" , desc = "辅国大将军，仅次于三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5149] = {class = 2 , level = 10 , sort = "当前在任" , note = "中军大将军" , desc = "中军大将军，仅次于三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5150] = {class = 2 , level = 10 , sort = "当前在任" , note = "上军大将军" , desc = "上军大将军，仅次于三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5151] = {class = 2 , level = 11 , sort = "当前在任" , note = "卫将军" , desc = "卫将军，三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5152] = {class = 2 , level = 11 , sort = "当前在任" , note = "车骑将军" , desc = "车骑将军，三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5153] = {class = 2 , level = 11 , sort = "当前在任" , note = "骠骑将军" , desc = "骠骑将军，三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5154] = {class = 2 , level = 11 , sort = "当前在任" , note = "卫将军" , desc = "卫将军，三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5155] = {class = 2 , level = 11 , sort = "当前在任" , note = "车骑将军" , desc = "车骑将军，三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5156] = {class = 2 , level = 11 , sort = "当前在任" , note = "骠骑将军" , desc = "骠骑将军，三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5157] = {class = 2 , level = 11 , sort = "当前在任" , note = "卫将军" , desc = "卫将军，三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5158] = {class = 2 , level = 11 , sort = "当前在任" , note = "车骑将军" , desc = "车骑将军，三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5159] = {class = 2 , level = 11 , sort = "当前在任" , note = "骠骑将军" , desc = "骠骑将军，三公级别的将军号。" , desc_1 = "" , desc_2 = ""}
position_definition[5160] = {class = 2 , level = 12 , sort = "当前在任" , note = "大将军" , desc = "大将军，蜀汉最高军事统帅，统领全国武将。" , desc_1 = "" , desc_2 = ""}
position_definition[5161] = {class = 2 , level = 12 , sort = "当前在任" , note = "大都督" , desc = "大都督，东吴最高军事统帅，统领全国武将。" , desc_1 = "" , desc_2 = ""}
position_definition[5162] = {class = 2 , level = 12 , sort = "当前在任" , note = "大将军" , desc = "大将军，曹魏最高军事统帅，统领全国武将。" , desc_1 = "" , desc_2 = ""}
position_definition[5201] = {class = 1 , level = 1 , sort = "永久官职" , note = "书佐" , desc = "书佐，负责文字事务的佐吏。" , desc_1 = "" , desc_2 = ""}
position_definition[5202] = {class = 1 , level = 2 , sort = "永久官职" , note = "功曹" , desc = "功曹，高级官员的属吏，掌管考查功绩。" , desc_1 = "" , desc_2 = ""}
position_definition[5203] = {class = 1 , level = 3 , sort = "永久官职" , note = "主簿" , desc = "主簿，高级官员的属吏，掌管文书簿笈。" , desc_1 = "" , desc_2 = ""}
position_definition[5204] = {class = 1 , level = 4 , sort = "永久官职" , note = "别驾" , desc = "别驾，刺史的高级佐吏，出巡时和刺史各乘一车。" , desc_1 = "" , desc_2 = ""}
position_definition[5205] = {class = 1 , level = 4 , sort = "永久官职" , note = "长史" , desc = "长史，为军府中的幕僚之长。" , desc_1 = "" , desc_2 = ""}
position_definition[5206] = {class = 1 , level = 5 , sort = "永久官职" , note = "太乐令" , desc = "太乐令，太常的属官，主掌宫廷音乐。" , desc_1 = "" , desc_2 = ""}
position_definition[5207] = {class = 1 , level = 5 , sort = "永久官职" , note = "太史令" , desc = "太史令，太常的属官，主掌天文星历。" , desc_1 = "" , desc_2 = ""}
position_definition[5208] = {class = 1 , level = 5 , sort = "永久官职" , note = "太医令" , desc = "太医令，少府的属官，主掌宫廷医事。" , desc_1 = "" , desc_2 = ""}
position_definition[5209] = {class = 1 , level = 5 , sort = "永久官职" , note = "太仓令" , desc = "太仓令，大司农的属官，主掌郡国仓储。" , desc_1 = "" , desc_2 = ""}
position_definition[5210] = {class = 1 , level = 7 , sort = "永久官职" , note = "太中大夫" , desc = "太中大夫，职掌言议，顾问应对。" , desc_1 = "" , desc_2 = ""}
position_definition[5211] = {class = 1 , level = 7 , sort = "永久官职" , note = "尚书仆射" , desc = "尚书仆射，尚书台的副首长。" , desc_1 = "" , desc_2 = ""}
position_definition[5212] = {class = 1 , level = 7 , sort = "永久官职" , note = "中散大夫" , desc = "中散大夫，职掌言议，顾问应对。" , desc_1 = "" , desc_2 = ""}
position_definition[5213] = {class = 1 , level = 6 , sort = "永久官职" , note = "谏议大夫" , desc = "谏议大夫，职掌言议，顾问应对。" , desc_1 = "" , desc_2 = ""}
position_definition[5214] = {class = 1 , level = 6 , sort = "永久官职" , note = "太子洗马" , desc = "太子洗马，太子属官，太子出行为前导。" , desc_1 = "" , desc_2 = ""}
position_definition[5215] = {class = 1 , level = 6 , sort = "永久官职" , note = "散骑常侍" , desc = "散骑常侍，规谏过失，以备顾问。" , desc_1 = "" , desc_2 = ""}
position_definition[5216] = {class = 1 , level = 8 , sort = "永久官职" , note = "尚书令" , desc = "尚书令，直接对皇帝负责，掌管政令。" , desc_1 = "" , desc_2 = ""}
position_definition[5217] = {class = 1 , level = 8 , sort = "永久官职" , note = "中书令" , desc = "中书令，秘书令改名而来，掌握机要。" , desc_1 = "" , desc_2 = ""}
position_definition[5218] = {class = 1 , level = 9 , sort = "永久官职" , note = "太子太傅" , desc = "太子太傅，教导辅佐太子的师傅。" , desc_1 = "" , desc_2 = ""}
position_definition[5219] = {class = 1 , level = 8 , sort = "永久官职" , note = "太子少傅" , desc = "太子少傅，教导辅佐太子的师傅。" , desc_1 = "" , desc_2 = ""}
position_definition[5220] = {class = 1 , level = 8 , sort = "永久官职" , note = "侍中" , desc = "侍中，皇帝侧近，顾问应对，拾遗补缺。" , desc_1 = "" , desc_2 = ""}
position_definition[5221] = {class = 1 , level = 9 , sort = "永久官职" , note = "执金吾" , desc = "执金吾，主掌徼循京师。" , desc_1 = "" , desc_2 = ""}
position_definition[5222] = {class = 1 , level = 9 , sort = "永久官职" , note = "将作大匠" , desc = "将作大匠，主掌各种工程。" , desc_1 = "" , desc_2 = ""}
position_definition[5223] = {class = 1 , level = 9 , sort = "永久官职" , note = "水衡都尉" , desc = "水衡都尉，掌水军舟船器械。" , desc_1 = "" , desc_2 = ""}
position_definition[5224] = {class = 1 , level = 10 , sort = "当前在任" , note = "宗正" , desc = "宗正，九卿之一，掌管皇族与外戚事务。" , desc_1 = "" , desc_2 = ""}
position_definition[5225] = {class = 1 , level = 10 , sort = "当前在任" , note = "廷尉" , desc = "廷尉，九卿之一，掌管刑法狱讼。" , desc_1 = "" , desc_2 = ""}
position_definition[5226] = {class = 1 , level = 10 , sort = "当前在任" , note = "光禄勋" , desc = "光禄勋，九卿之一，掌管宿卫宫殿门户。" , desc_1 = "" , desc_2 = ""}
position_definition[5227] = {class = 1 , level = 10 , sort = "当前在任" , note = "少府" , desc = "少府，九卿之一，掌管皇室财务。" , desc_1 = "" , desc_2 = ""}
position_definition[5228] = {class = 1 , level = 10 , sort = "当前在任" , note = "太仆" , desc = "太仆，九卿之一，掌管舆马及牧畜。" , desc_1 = "" , desc_2 = ""}
position_definition[5229] = {class = 1 , level = 10 , sort = "当前在任" , note = "太常" , desc = "太常，九卿之一，掌管礼乐社稷、宗庙礼仪。" , desc_1 = "" , desc_2 = ""}
position_definition[5230] = {class = 1 , level = 10 , sort = "当前在任" , note = "卫尉" , desc = "卫尉，九卿之一，掌管皇城巡视。" , desc_1 = "" , desc_2 = ""}
position_definition[5231] = {class = 1 , level = 10 , sort = "当前在任" , note = "大鸿胪" , desc = "大鸿胪，九卿之一，掌管接待宾客。" , desc_1 = "" , desc_2 = ""}
position_definition[5232] = {class = 1 , level = 10 , sort = "当前在任" , note = "大司农" , desc = "大司农，九卿之一，掌管国家财政。" , desc_1 = "" , desc_2 = ""}
position_definition[5233] = {class = 1 , level = 10 , sort = "当前在任" , note = "宗正" , desc = "宗正，九卿之一，掌管皇族与外戚事务。" , desc_1 = "" , desc_2 = ""}
position_definition[5234] = {class = 1 , level = 10 , sort = "当前在任" , note = "廷尉" , desc = "廷尉，九卿之一，掌管刑法狱讼。" , desc_1 = "" , desc_2 = ""}
position_definition[5235] = {class = 1 , level = 10 , sort = "当前在任" , note = "光禄勋" , desc = "光禄勋，九卿之一，掌管宿卫宫殿门户。" , desc_1 = "" , desc_2 = ""}
position_definition[5236] = {class = 1 , level = 10 , sort = "当前在任" , note = "少府" , desc = "少府，九卿之一，掌管皇室财务。" , desc_1 = "" , desc_2 = ""}
position_definition[5237] = {class = 1 , level = 10 , sort = "当前在任" , note = "太仆" , desc = "太仆，九卿之一，掌管舆马及牧畜。" , desc_1 = "" , desc_2 = ""}
position_definition[5238] = {class = 1 , level = 10 , sort = "当前在任" , note = "太常" , desc = "太常，九卿之一，掌管礼乐社稷、宗庙礼仪。" , desc_1 = "" , desc_2 = ""}
position_definition[5239] = {class = 1 , level = 10 , sort = "当前在任" , note = "卫尉" , desc = "卫尉，九卿之一，掌管皇城巡视。" , desc_1 = "" , desc_2 = ""}
position_definition[5240] = {class = 1 , level = 10 , sort = "当前在任" , note = "大鸿胪" , desc = "大鸿胪，九卿之一，掌管接待宾客。" , desc_1 = "" , desc_2 = ""}
position_definition[5241] = {class = 1 , level = 10 , sort = "当前在任" , note = "大司农" , desc = "大司农，九卿之一，掌管国家财政。" , desc_1 = "" , desc_2 = ""}
position_definition[5242] = {class = 1 , level = 10 , sort = "当前在任" , note = "宗正" , desc = "宗正，九卿之一，掌管皇族与外戚事务。" , desc_1 = "" , desc_2 = ""}
position_definition[5243] = {class = 1 , level = 10 , sort = "当前在任" , note = "廷尉" , desc = "廷尉，九卿之一，掌管刑法狱讼。" , desc_1 = "" , desc_2 = ""}
position_definition[5244] = {class = 1 , level = 10 , sort = "当前在任" , note = "光禄勋" , desc = "光禄勋，九卿之一，掌管宿卫宫殿门户。" , desc_1 = "" , desc_2 = ""}
position_definition[5245] = {class = 1 , level = 10 , sort = "当前在任" , note = "少府" , desc = "少府，九卿之一，掌管皇室财务。" , desc_1 = "" , desc_2 = ""}
position_definition[5246] = {class = 1 , level = 10 , sort = "当前在任" , note = "太仆" , desc = "太仆，九卿之一，掌管舆马及牧畜。" , desc_1 = "" , desc_2 = ""}
position_definition[5247] = {class = 1 , level = 10 , sort = "当前在任" , note = "太常" , desc = "太常，九卿之一，掌管礼乐社稷、宗庙礼仪。" , desc_1 = "" , desc_2 = ""}
position_definition[5248] = {class = 1 , level = 10 , sort = "当前在任" , note = "卫尉" , desc = "卫尉，九卿之一，掌管皇城巡视。" , desc_1 = "" , desc_2 = ""}
position_definition[5249] = {class = 1 , level = 10 , sort = "当前在任" , note = "大鸿胪" , desc = "大鸿胪，九卿之一，掌管接待宾客。" , desc_1 = "" , desc_2 = ""}
position_definition[5250] = {class = 1 , level = 10 , sort = "当前在任" , note = "大司农" , desc = "大司农，九卿之一，掌管国家财政。" , desc_1 = "" , desc_2 = ""}
position_definition[5251] = {class = 1 , level = 11 , sort = "当前在任" , note = "司空" , desc = "司空，三公之一，掌管全国行政。" , desc_1 = "" , desc_2 = ""}
position_definition[5252] = {class = 1 , level = 11 , sort = "当前在任" , note = "司徒" , desc = "司徒，三公之一，掌管全国刑法。" , desc_1 = "" , desc_2 = ""}
position_definition[5253] = {class = 1 , level = 11 , sort = "当前在任" , note = "太尉" , desc = "太尉，三公之一，掌管全国军政。" , desc_1 = "" , desc_2 = ""}
position_definition[5254] = {class = 1 , level = 11 , sort = "当前在任" , note = "司空" , desc = "司空，三公之一，掌管全国行政。" , desc_1 = "" , desc_2 = ""}
position_definition[5255] = {class = 1 , level = 11 , sort = "当前在任" , note = "司徒" , desc = "司徒，三公之一，掌管全国刑法。" , desc_1 = "" , desc_2 = ""}
position_definition[5256] = {class = 1 , level = 11 , sort = "当前在任" , note = "太尉" , desc = "太尉，三公之一，掌管全国军政。" , desc_1 = "" , desc_2 = ""}
position_definition[5257] = {class = 1 , level = 11 , sort = "当前在任" , note = "司空" , desc = "司空，三公之一，掌管全国行政。" , desc_1 = "" , desc_2 = ""}
position_definition[5258] = {class = 1 , level = 11 , sort = "当前在任" , note = "司徒" , desc = "司徒，三公之一，掌管全国刑法。" , desc_1 = "" , desc_2 = ""}
position_definition[5259] = {class = 1 , level = 11, sort = "当前在任" , note = "太尉" , desc = "太尉，三公之一，掌管全国军政。" , desc_1 = "" , desc_2 = ""}
position_definition[5260] = {class = 1 , level = 12 , sort = "当前在任" , note = "大丞相" , desc = "大丞相，蜀汉最高政府首脑，统领全国文官。" , desc_1 = "" , desc_2 = ""}
position_definition[5261] = {class = 1 , level = 12 , sort = "当前在任" , note = "大丞相" , desc = "大丞相，东吴最高政府首脑，统领全国文官。" , desc_1 = "" , desc_2 = ""}
position_definition[5262] = {class = 1 , level = 12 , sort = "当前在任" , note = "大丞相" , desc = "大丞相，曹魏最高政府首脑，统领全国文官。" , desc_1 = "" , desc_2 = ""}
position_definition[5263] = {class = 2 , level = 6 , sort = "永久官职" , note = "建威中郎将" , desc = "建威中郎将，领兵中郎将之一。" , desc_1 = "" , desc_2 = ""}
position_definition[5264] = {class = 2 , level = 7 , sort = "永久官职" , note = "武卫中郎将" , desc = "武卫中郎将，统率武卫营的将领。" , desc_1 = "" , desc_2 = ""}
position_definition[5265] = {class = 1 , level = 6 , sort = "永久官职" , note = "谒者仆射" , desc = "掌殿廷朝会礼仪，接受臣民章奏。" , desc_1 = "" , desc_2 = ""}
position_definition[5266] = {class = 1 , level = 7 , sort = "永久官职" , note = "御史中丞" , desc = "御史台长官，收纳并审查公卿奏事上报皇帝。" , desc_1 = "" , desc_2 = ""}

--主函数，从程序取得官职id，接口为GetPositiondesc()
--返回客户端显示用数值，class（官职类别，1文官，2武官），level（官阶等级），linedesc（列表框单行的显示文字），salary（俸禄）, levelname（官阶名称），desc（官职说明）

Position_desc = {}
function Position_desc:GetPositiondesc(id)
	local class, level, note, sort, desc = position_definition[id].class , position_definition[id].level , position_definition[id].note , position_definition[id].sort , position_definition[id].desc
	local salary , levelname = positionlevel_definition[level].salary, positionlevel_definition[level].levelname
	local linedesc = string.format("%s%s%s%s%s" , levelname , "\t" , note , "\t" , sort)
	if class == 0 then
		level = 0
	end
--	return 1, 1, "一品\t大将军\t永久官职", 100, "三品", "说明文字111111"
	return class, level, linedesc, salary, levelname, desc
end

----测试官职输出是否正确
--local id = 0
--
--StdPrint("输入官职id：")
--repid=io.read("*number")
--
--local repclass , replevel , replinedesc , repsalary , replevelname , repdesc = Position_desc:GetPositiondesc(repid)
--local repclassname = positionclass_definition[repclass].classname
--local repstr = string.format("%s%d%s%s%s%d%s%s%s%s%s%s%s%s%s" , "官职类别：\t" , repclass , "\t" , repclassname , "\n官阶等级：\t" , replevel , "\t" , replevelname , "\n列表框文字：\t" , replinedesc , "\n俸禄：\t" , repsalary , "\n官职说明：\t" , repdesc , "\n")
--
--StdPrint(repstr)


