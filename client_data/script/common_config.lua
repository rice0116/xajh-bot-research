HpMaxPotion = {
    {pile_count = 10000, factor = 5, cur_level_count = 10000},
    {pile_count = 20000, factor = 3, cur_level_count = 10000},
    {pile_count = 30000, factor = 2, cur_level_count = 10000},
}

HpMaxPotionConfig = {
    max_hp_limit = 100000,
    max_percent_limit = 0.14,
    max_level_calculate_unit = 500,
    max_level_calculate_ratio = 0.001
}

function GetHpMaxPotionValue(item_count, cur_hp)
    local add_hp = 0
    if (item_count <= 0) then
        return add_hp
    end
    local cur_item_count = item_count
    for i,v in ipairs(HpMaxPotion) do
        if item_count > v.pile_count then
            add_hp = add_hp + v.cur_level_count * v.factor
            cur_item_count = cur_item_count - v.cur_level_count
        else
            add_hp = add_hp + cur_item_count * v.factor
            cur_item_count = 0;
            break
        end
    end
    if cur_item_count > 0 then
        cur_hp = cur_hp + HpMaxPotionConfig.max_hp_limit
        add_hp = add_hp + math.floor(cur_item_count / HpMaxPotionConfig.max_level_calculate_unit) * (cur_hp * HpMaxPotionConfig.max_level_calculate_ratio)
        local max_hp = math.floor(cur_hp * (1 + HpMaxPotionConfig.max_percent_limit))
        if add_hp > max_hp then
            add_hp = max_hp
        end
    end
    return math.floor(add_hp)
end

--宝石价格
StonePrice = {
{tid = 0, price=0},
{tid = 56530, price=1},	--1级日光石
{tid = 56531, price=5},	--2级日光石
{tid = 56532, price=25},	--3级日光石
{tid = 56533, price=125},	--4级日光石
{tid = 56534, price=600},	--5级日光石
{tid = 56535, price=3000},	--6级日光石
{tid = 56536, price=9999},	--7级日光石
{tid = 56537, price=9999},	--8级日光石
{tid = 56538, price=9999},	--9级日光石
{tid = 56539, price=9999},	--10级日光石
{tid = 56540, price=1},	--1级月光石
{tid = 56541, price=5},	--2级月光石
{tid = 56542, price=25},	--3级月光石
{tid = 56543, price=125},	--4级月光石
{tid = 56544, price=600},	--5级月光石
{tid = 56545, price=3000},	--6级月光石
{tid = 56546, price=9999},	--7级月光石
{tid = 56547, price=9999},	--8级月光石
{tid = 56548, price=9999},	--9级月光石
{tid = 56549, price=9999},	--10级月光石
{tid = 56550, price=1},	--1级红宝石
{tid = 56551, price=5},	--2级红宝石
{tid = 56552, price=25},	--3级红宝石
{tid = 56553, price=125},	--4级红宝石
{tid = 56554, price=600},	--5级红宝石
{tid = 56555, price=3000},	--6级红宝石
{tid = 56556, price=9999},	--7级红宝石
{tid = 56557, price=9999},	--8级红宝石
{tid = 56558, price=9999},	--9级红宝石
{tid = 56559, price=9999},	--10级红宝石
{tid = 56560, price=1},	--1级蓝宝石
{tid = 56561, price=5},	--2级蓝宝石
{tid = 56562, price=25},	--3级蓝宝石
{tid = 56563, price=125},	--4级蓝宝石
{tid = 56564, price=600},	--5级蓝宝石
{tid = 56565, price=3000},	--6级蓝宝石
{tid = 566, price=9999},	--7级蓝宝石
{tid = 567, price=9999},	--8级蓝宝石
{tid = 568, price=9999},	--9级蓝宝石
{tid = 56569, price=9999},	--10级蓝宝石
{tid = 56570, price=1},	--1级白水晶
{tid = 56571, price=5},	--2级白水晶
{tid = 56572, price=25},	--3级白水晶
{tid = 56573, price=125},	--4级白水晶
{tid = 56574, price=600},	--5级白水晶
{tid = 56575, price=3000},	--6级白水晶
{tid = 56576, price=9999},	--7级白水晶
{tid = 56577, price=9999},	--8级白水晶
{tid = 56578, price=9999},	--9级白水晶
{tid = 56579, price=9999},	--10级白水晶
{tid = 56580, price=1},	--1级红水晶
{tid = 56581, price=5},	--2级红水晶
{tid = 56582, price=25},	--3级红水晶
{tid = 56583, price=125},	--4级红水晶
{tid = 56584, price=600},	--5级红水晶
{tid = 56585, price=3000},	--6级红水晶
{tid = 56586, price=9999},	--7级红水晶
{tid = 56587, price=9999},	--8级红水晶
{tid = 56588, price=9999},	--9级红水晶
{tid = 56589, price=9999},	--10级红水晶
{tid = 56590, price=1},	--1级黄水晶
{tid = 56591, price=5},	--2级黄水晶
{tid = 56592, price=25},	--3级黄水晶
{tid = 56593, price=125},	--4级黄水晶
{tid = 56594, price=600},	--5级黄水晶
{tid = 56595, price=3000},	--6级黄水晶
{tid = 56596, price=9999},	--7级黄水晶
{tid = 56597, price=9999},	--8级黄水晶
{tid = 56598, price=9999},	--9级黄水晶
{tid = 56599, price=9999},	--10级黄水晶
{tid = 56600, price=1},	--1级墨水晶
{tid = 56601, price=5},	--2级墨水晶
{tid = 56602, price=25},	--3级墨水晶
{tid = 56603, price=125},	--4级墨水晶
{tid = 56604, price=600},	--5级墨水晶
{tid = 56605, price=3000},	--6级墨水晶
{tid = 56606, price=9999},	--7级墨水晶
{tid = 56607, price=9999},	--8级墨水晶
{tid = 56608, price=9999},	--9级墨水晶
{tid = 56609, price=9999},	--10级墨水晶
{tid = 56610, price=1},	--1级白玛瑙
{tid = 56611, price=5},	--2级白玛瑙
{tid = 56612, price=25},	--3级白玛瑙
{tid = 56613, price=125},	--4级白玛瑙
{tid = 56614, price=600},	--5级白玛瑙
{tid = 56615, price=3000},	--6级白玛瑙
{tid = 56616, price=9999},	--7级白玛瑙
{tid = 56617, price=9999},	--8级白玛瑙
{tid = 56618, price=9999},	--9级白玛瑙
{tid = 56619, price=9999},	--10级白玛瑙
{tid = 56636, price=1},	--1级红玛瑙
{tid = 56637, price=5},	--2级红玛瑙
{tid = 56638, price=25},	--3级红玛瑙
{tid = 56639, price=125},	--4级红玛瑙
{tid = 56640, price=600},	--5级红玛瑙
{tid = 56641, price=3000},	--6级红玛瑙
{tid = 56642, price=9999},	--7级红玛瑙
{tid = 56643, price=9999},	--8级红玛瑙
{tid = 56644, price=9999},	--9级红玛瑙
{tid = 56645, price=9999},	--10级红玛瑙
{tid = 56646, price=1},	--1级黄玛瑙
{tid = 56647, price=5},	--2级黄玛瑙
{tid = 56648, price=25},	--3级黄玛瑙
{tid = 56649, price=125},	--4级黄玛瑙
{tid = 56650, price=600},	--5级黄玛瑙
{tid = 56651, price=3000},	--6级黄玛瑙
{tid = 56652, price=9999},	--7级黄玛瑙
{tid = 56653, price=9999},	--8级黄玛瑙
{tid = 56654, price=9999},	--9级黄玛瑙
{tid = 56655, price=9999},	--10级黄玛瑙
{tid = 56656, price=1},	--1级绿玛瑙
{tid = 56657, price=5},	--2级绿玛瑙
{tid = 56658, price=25},	--3级绿玛瑙
{tid = 56659, price=125},	--4级绿玛瑙
{tid = 56660, price=600},	--5级绿玛瑙
{tid = 56661, price=3000},	--6级绿玛瑙
{tid = 56662, price=9999},	--7级绿玛瑙
{tid = 56663, price=9999},	--8级绿玛瑙
{tid = 56664, price=9999},	--9级绿玛瑙
{tid = 56665, price=9999},	--10级绿玛瑙
{tid = 56666, price=1},	--1级东陵石
{tid = 56667, price=5},	--2级东陵石
{tid = 56668, price=25},	--3级东陵石
{tid = 56669, price=125},	--4级东陵石
{tid = 56670, price=600},	--5级东陵石
{tid = 56671, price=3000},	--6级东陵石
{tid = 56672, price=9999},	--7级东陵石
{tid = 56673, price=9999},	--8级东陵石
{tid = 56674, price=9999},	--9级东陵石
{tid = 56675, price=9999},	--10级东陵石
{tid = 56676, price=1},	--1级苍珊瑚
{tid = 56677, price=5},	--2级苍珊瑚
{tid = 56678, price=25},	--3级苍珊瑚
{tid = 56679, price=125},	--4级苍珊瑚
{tid = 56680, price=600},	--5级苍珊瑚
{tid = 56681, price=3000},	--6级苍珊瑚
{tid = 56682, price=9999},	--7级苍珊瑚
{tid = 56683, price=9999},	--8级苍珊瑚
{tid = 56684, price=9999},	--9级苍珊瑚
{tid = 56685, price=9999},	--10级苍珊瑚
{tid = 56686, price=1},	--1级刺珊瑚
{tid = 56687, price=5},	--2级刺珊瑚
{tid = 56688, price=25},	--3级刺珊瑚
{tid = 56689, price=125},	--4级刺珊瑚
{tid = 56690, price=600},	--5级刺珊瑚
{tid = 56691, price=3000},	--6级刺珊瑚
{tid = 56692, price=9999},	--7级刺珊瑚
{tid = 56693, price=9999},	--8级刺珊瑚
{tid = 56694, price=9999},	--9级刺珊瑚
{tid = 56695, price=9999},	--10级刺珊瑚
{tid = 56696, price=1},	--1级红珊瑚
{tid = 56697, price=5},	--2级红珊瑚
{tid = 56698, price=25},	--3级红珊瑚
{tid = 56699, price=125},	--4级红珊瑚
{tid = 56700, price=600},	--5级红珊瑚
{tid = 56701, price=3000},	--6级红珊瑚
{tid = 56702, price=9999},	--7级红珊瑚
{tid = 56703, price=9999},	--8级红珊瑚
{tid = 56704, price=9999},	--9级红珊瑚
{tid = 56705, price=9999},	--10级红珊瑚
{tid = 56706, price=1},	--1级角珊瑚
{tid = 56707, price=5},	--2级角珊瑚
{tid = 56708, price=25},	--3级角珊瑚
{tid = 56709, price=125},	--4级角珊瑚
{tid = 56710, price=600},	--5级角珊瑚
{tid = 56711, price=3000},	--6级角珊瑚
{tid = 56712, price=9999},	--7级角珊瑚
{tid = 56713, price=9999},	--8级角珊瑚
{tid = 56714, price=9999},	--9级角珊瑚
{tid = 56715, price=9999},	--10级角珊瑚
{tid = 56716, price=1},	--1级石珊瑚
{tid = 56717, price=5},	--2级石珊瑚
{tid = 56718, price=25},	--3级石珊瑚
{tid = 56719, price=125},	--4级石珊瑚
{tid = 56720, price=600},	--5级石珊瑚
{tid = 56721, price=3000},	--6级石珊瑚
{tid = 56722, price=9999},	--7级石珊瑚
{tid = 56723, price=9999},	--8级石珊瑚
{tid = 56724, price=9999},	--9级石珊瑚
{tid = 56725, price=9999},	--10级石珊瑚
{tid = 56726, price=1},	--1级白玿


{tid = 56727, price=5},	--2级白玿
{tid = 56728, price=25},	--3级白玿
{tid = 56729, price=125},	--4级白玿


{tid = 56730, price=600},	--5级白玿


{tid = 56731, price=3000},	--6级白玿
{tid = 56732, price=9999},	--7级白玿


{tid = 56733, price=9999},	--8级白玿


{tid = 56734, price=9999},	--9级白玿


{tid = 56735, price=9999},	--10级白玿


{tid = 56736, price=1},	--1级碧玿
{tid = 56737, price=5},	--2级碧玿


{tid = 56738, price=25},	--3级碧玿
{tid = 56739, price=125},	--4级碧玿
{tid = 56740, price=600},	--5级碧玿


{tid = 56741, price=3000},	--6级碧玿


{tid = 56742, price=9999},	--7级碧玿
{tid = 56743, price=9999},	--8级碧玿


{tid = 56744, price=9999},	--9级碧玿


{tid = 56745, price=9999},	--10级碧玿


{tid = 56746, price=1},	--1级红玿


{tid = 56747, price=5},	--2级红玿


{tid = 56748, price=25},	--3级红玿
{tid = 56749, price=125},	--4级红玿


{tid = 56750, price=600},	--5级红玿


{tid = 56751, price=3000},	--6级红玿


{tid = 56752, price=9999},	--7级红玿


{tid = 56753, price=9999},	--8级红玿


{tid = 56754, price=9999},	--9级红玿


{tid = 56755, price=9999},	--10级红玿
{tid = 56756, price=1},	--1级黄玿


{tid = 56757, price=5},	--2级黄玿


{tid = 56758, price=25},	--3级黄玿


{tid = 56759, price=125},	--4级黄玿


{tid = 56760, price=600},	--5级黄玿


{tid = 56761, price=3000},	--6级黄玿


{tid = 56762, price=9999},	--7级黄玿
{tid = 56763, price=9999},	--8级黄玿
{tid = 56764, price=9999},	--9级黄玿


{tid = 56765, price=9999},	--10级黄玿


{tid = 56766, price=1},	--1级青金石
{tid = 56767, price=5},	--2级青金石
{tid = 56768, price=25},	--3级青金石
{tid = 56769, price=125},	--4级青金石
{tid = 56770, price=600},	--5级青金石
{tid = 56771, price=3000},	--6级青金石
{tid = 56772, price=9999},	--7级青金石
{tid = 56773, price=9999},	--8级青金石
{tid = 56774, price=9999},	--9级青金石
{tid = 56775, price=9999},	--10级青金石
{tid = 56779, price=1},	--1级黑珍珠
{tid = 56780, price=5},	--2级黑珍珠
{tid = 56781, price=25},	--3级黑珍珠
{tid = 56782, price=125},	--4级黑珍珠
{tid = 56783, price=600},	--5级黑珍珠
{tid = 56784, price=3000},	--6级黑珍珠
{tid = 56785, price=9999},	--7级黑珍珠
{tid = 56786, price=9999},	--8级黑珍珠
{tid = 56787, price=9999},	--9级黑珍珠
{tid = 56788, price=9999},	--10级黑珍珠
{tid = 56789, price=3},	--1级红翡翠
{tid = 56790, price=15},	--2级红翡翠
{tid = 56791, price=75},	--3级红翡翠
{tid = 56792, price=375},	--4级红翡翠
{tid = 56793, price=1800},	--5级红翡翠
{tid = 56794, price=9000},	--6级红翡翠
{tid = 56795, price=9999},	--7级红翡翠
{tid = 56796, price=9999},	--8级红翡翠
{tid = 56797, price=9999},	--9级红翡翠
{tid = 56798, price=9999},	--10级红翡翠
{tid = 56799, price=3},	--1级黄棕翡
{tid = 56800, price=15},	--2级黄棕翡
{tid = 56801, price=75},	--3级黄棕翡
{tid = 56802, price=375},	--4级黄棕翡
{tid = 56803, price=1800},	--5级黄棕翡
{tid = 56804, price=9000},	--6级黄棕翡
{tid = 56805, price=9999},	--7级黄棕翡
{tid = 56806, price=9999},	--8级黄棕翡
{tid = 56807, price=9999},	--9级黄棕翡
{tid = 56808, price=9999},	--10级黄棕翡
{tid = 56809, price=3},	--1级兰花冰
{tid = 56810, price=15},	--2级兰花冰
{tid = 56811, price=75},	--3级兰花冰
{tid = 56812, price=375},	--4级兰花冰
{tid = 56813, price=1800},	--5级兰花冰
{tid = 56814, price=9000},	--6级兰花冰
{tid = 56815, price=9999},	--7级兰花冰
{tid = 56816, price=9999},	--8级兰花冰
{tid = 56817, price=9999},	--9级兰花冰
{tid = 56818, price=9999},	--10级兰花冰
{tid = 56819, price=3},	--1级墨翡翠
{tid = 56820, price=15},	--2级墨翡翠
{tid = 56821, price=75},	--3级墨翡翠
{tid = 56822, price=375},	--4级墨翡翠
{tid = 56823, price=1800},	--5级墨翡翠
{tid = 56824, price=9000},	--6级墨翡翠
{tid = 56825, price=9999},	--7级墨翡翠
{tid = 56826, price=9999},	--8级墨翡翠
{tid = 56827, price=9999},	--9级墨翡翠
{tid = 56828, price=9999},	--10级墨翡翠
{tid = 75278, price=1},	--1级虹彩石
{tid = 75279, price=5},	--2级虹彩石
{tid = 75280, price=25},	--3级虹彩石
{tid = 75281, price=125},	--4级虹彩石
{tid = 75282, price=600},	--5级虹彩石
{tid = 75283, price=3000},	--6级虹彩石
{tid = 75284, price=9999},	--7级虹彩石
{tid = 75285, price=9999},	--8级虹彩石
{tid = 75286, price=9999},	--9级虹彩石
{tid = 75287, price=9999},	--10级虹彩石
{tid = 75289, price=1},	--1级天河石
{tid = 75290, price=5},	--2级天河石
{tid = 75291, price=25},	--3级天河石
{tid = 75292, price=125},	--4级天河石
{tid = 75293, price=600},	--5级天河石
{tid = 75294, price=3000},	--6级天河石
{tid = 75295, price=9999},	--7级天河石
{tid = 75296, price=9999},	--8级天河石
{tid = 75297, price=9999},	--9级天河石
{tid = 75298, price=9999},	--10级天河石
{tid = 93445, price=150},	--（优质的＿级红翡翠
{tid = 93446, price=750},	--（优质的＿级红翡翠
{tid = 93447, price=3600},	--（优质的＿级红翡翠
{tid = 93448, price=18000},	--（优质的＿级红翡翠
{tid = 93449, price=150},	--（优质的＿级黄棕翡
{tid = 93450, price=750},	--（优质的＿级黄棕翡
{tid = 93451, price=3600},	--（优质的＿级黄棕翡
{tid = 93452, price=18000},	--（优质的＿级黄棕翡
{tid = 93453, price=150},	--（优质的＿级兰花冰
{tid = 93454, price=750},	--（优质的＿级兰花冰
{tid = 93455, price=3600},	--（优质的＿级兰花冰
{tid = 93456, price=18000},	--（优质的＿级兰花冰
{tid = 93457, price=150},	--（优质的＿级墨翡翠
{tid = 93458, price=750},	--（优质的＿级墨翡翠
{tid = 93459, price=3600},	--（优质的＿级墨翡翠
{tid = 93460, price=18000},	--（优质的＿级墨翡翠
{tid = 93461, price=50},	--（优质的＿级红宝石
{tid = 93462, price=250},	--（优质的＿级红宝石
{tid = 93463, price=1200},	--（优质的＿级红宝石
{tid = 93464, price=6000},	--（优质的＿级红宝石
{tid = 93465, price=50},	--（优质的＿级蓝宝石
{tid = 93466, price=250},	--（优质的＿级蓝宝石
{tid = 93467, price=1200},	--（优质的＿级蓝宝石
{tid = 93468, price=6000},	--（优质的＿级蓝宝石
{tid = 93469, price=50},	--（优质的＿级白水晶
{tid = 93470, price=250},	--（优质的＿级白水晶
{tid = 93471, price=1200},	--（优质的＿级白水晶
{tid = 93472, price=6000},	--（优质的＿级白水晶
{tid = 93473, price=50},	--（优质的＿级红水晶
{tid = 93474, price=250},	--（优质的＿级红水晶
{tid = 93475, price=1200},	--（优质的＿级红水晶
{tid = 93476, price=6000},	--（优质的＿级红水晶
{tid = 93477, price=50},	--（优质的＿级黄水晶
{tid = 93478, price=250},	--（优质的＿级黄水晶
{tid = 93479, price=1200},	--（优质的＿级黄水晶
{tid = 93480, price=6000},	--（优质的＿级黄水晶
{tid = 93481, price=50},	--（优质的＿级墨水晶
{tid = 93482, price=250},	--（优质的＿级墨水晶
{tid = 93483, price=1200},	--（优质的＿级墨水晶
{tid = 93484, price=6000},	--（优质的＿级墨水晶
{tid = 93485, price=50},	--（优质的＿级白玛瑙
{tid = 93486, price=250},	--（优质的＿级白玛瑙
{tid = 93487, price=1200},	--（优质的＿级白玛瑙
{tid = 93488, price=6000},	--（优质的＿级白玛瑙
{tid = 93489, price=50},	--（优质的＿级红玛瑙
{tid = 93490, price=250},	--（优质的＿级红玛瑙
{tid = 93491, price=1200},	--（优质的＿级红玛瑙
{tid = 93492, price=6000},	--（优质的＿级红玛瑙
{tid = 93493, price=50},	--（优质的＿级黄玛瑙
{tid = 93494, price=250},	--（优质的＿级黄玛瑙
{tid = 93495, price=1200},	--（优质的＿级黄玛瑙
{tid = 93496, price=6000},	--（优质的＿级黄玛瑙
{tid = 93497, price=50},	--（优质的＿级绿玛瑙
{tid = 93498, price=250},	--（优质的＿级绿玛瑙
{tid = 93499, price=1200},	--（优质的＿级绿玛瑙
{tid = 93500, price=6000},	--（优质的＿级绿玛瑙
{tid = 93501, price=50},	--（优质的＿级东陵石
{tid = 93502, price=250},	--（优质的＿级东陵石
{tid = 93503, price=1200},	--（优质的＿级东陵石
{tid = 93504, price=6000},	--（优质的＿级东陵石
{tid = 93505, price=50},	--（优质的＿级苍珊瑚
{tid = 93506, price=250},	--（优质的＿级苍珊瑚
{tid = 93507, price=1200},	--（优质的＿级苍珊瑚
{tid = 93508, price=6000},	--（优质的＿级苍珊瑚
{tid = 93509, price=50},	--（优质的＿级刺珊瑚
{tid = 93510, price=250},	--（优质的＿级刺珊瑚
{tid = 93511, price=1200},	--（优质的＿级刺珊瑚
{tid = 93512, price=6000},	--（优质的＿级刺珊瑚
{tid = 93513, price=50},	--（优质的＿级红珊瑚
{tid = 93514, price=250},	--（优质的＿级红珊瑚
{tid = 93515, price=1200},	--（优质的＿级红珊瑚
{tid = 93516, price=6000},	--（优质的＿级红珊瑚
{tid = 93517, price=50},	--（优质的＿级角珊瑚
{tid = 93518, price=250},	--（优质的＿级角珊瑚
{tid = 93519, price=1200},	--（优质的＿级角珊瑚
{tid = 93520, price=6000},	--（优质的＿级角珊瑚
{tid = 93521, price=50},	--（优质的＿级石珊瑚
{tid = 93522, price=250},	--（优质的＿级石珊瑚
{tid = 93523, price=1200},	--（优质的＿级石珊瑚
{tid = 93524, price=6000},	--（优质的＿级石珊瑚
{tid = 93525, price=50},	--（优质的＿级白玿


{tid = 93526, price=250},	--（优质的＿级白玿
{tid = 93527, price=1200},	--（优质的＿级白玿
{tid = 93528, price=6000},	--（优质的＿级白玿


{tid = 93529, price=50},	--（优质的＿级碧玿
{tid = 93530, price=250},	--（优质的＿级碧玿


{tid = 93531, price=1200},	--（优质的＿级碧玿


{tid = 93532, price=6000},	--（优质的＿级碧玿


{tid = 93533, price=50},	--（优质的＿级红玿


{tid = 93534, price=250},	--（优质的＿级红玿


{tid = 93535, price=1200},	--（优质的＿级红玿


{tid = 93536, price=6000},	--（优质的＿级红玿
{tid = 93537, price=50},	--（优质的＿级黄玿
{tid = 93538, price=250},	--（优质的＿级黄玿
{tid = 93539, price=1200},	--（优质的＿级黄玿


{tid = 93540, price=6000},	--（优质的＿级黄玿


{tid = 93541, price=50},	--（优质的＿级虹彩石
{tid = 93542, price=250},	--（优质的＿级虹彩石
{tid = 93543, price=1200},	--（优质的＿级虹彩石
{tid = 93544, price=6000},	--（优质的＿级虹彩石
{tid = 93545, price=50},	--（优质的＿级日光石
{tid = 93546, price=250},	--（优质的＿级日光石
{tid = 93547, price=1200},	--（优质的＿级日光石
{tid = 93548, price=6000},	--（优质的＿级日光石
{tid = 93549, price=50},	--（优质的＿级天河石
{tid = 93550, price=250},	--（优质的＿级天河石
{tid = 93551, price=1200},	--（优质的＿级天河石
{tid = 93552, price=6000},	--（优质的＿级天河石
{tid = 93553, price=50},	--（优质的＿级月光石
{tid = 93554, price=250},	--（优质的＿级月光石
{tid = 93555, price=1200},	--（优质的＿级月光石
{tid = 93556, price=6000},	--（优质的＿级月光石
{tid = 93557, price=50},	--（优质的＿级青金石
{tid = 93558, price=250},	--（优质的＿级青金石
{tid = 93559, price=1200},	--（优质的＿级青金石
{tid = 93560, price=6000},	--（优质的＿级青金石
{tid = 93561, price=50},	--（优质的＿级黑珍珠
{tid = 93562, price=250},	--（优质的＿级黑珍珠
{tid = 93563, price=1200},	--（优质的＿级黑珍珠
{tid = 93564, price=6000},	--（优质的＿级黑珍珠
{tid = 96941, price=2},
{tid = 96944, price=10},
{tid = 96947, price=50},
{tid = 96950, price=250},
{tid = 96951, price=250},
{tid = 96952, price=250},
{tid = 96953, price=1000},
{tid = 96954, price=1000},
{tid = 96955, price=1000},
{tid = 96956, price=3580},
{tid = 96957, price=3580},
{tid = 96958, price=3580},
{tid = 96959, price=12490},
{tid = 96960, price=12490},
{tid = 96961, price=12490},
{tid = 96962, price=28480},
{tid = 96963, price=28480},
{tid = 96964, price=28480},
{tid = 96965, price=63960},
{tid = 96966, price=63960},
{tid = 96967, price=63960},
{tid = 96968, price=2},
{tid = 96971, price=10},
{tid = 96974, price=50},
{tid = 96977, price=250},
{tid = 96978, price=250},
{tid = 96979, price=250},
{tid = 96980, price=1000},
{tid = 96981, price=1000},
{tid = 96982, price=1000},
{tid = 96983, price=3580},
{tid = 96984, price=3580},
{tid = 96985, price=3580},
{tid = 96986, price=12490},
{tid = 96987, price=12490},
{tid = 96988, price=12490},
{tid = 96989, price=28480},
{tid = 96990, price=28480},
{tid = 96991, price=28480},
{tid = 96992, price=63960},
{tid = 96993, price=63960},
{tid = 96994, price=63960},
{tid = 96995, price=2},
{tid = 96998, price=10},
{tid = 97001, price=50},
{tid = 97004, price=250},
{tid = 97005, price=250},
{tid = 97006, price=250},
{tid = 97007, price=1000},
{tid = 97008, price=1000},
{tid = 97009, price=1000},
{tid = 97010, price=3580},
{tid = 97011, price=3580},
{tid = 97012, price=3580},
{tid = 97013, price=12490},
{tid = 97014, price=12490},
{tid = 97015, price=12490},
{tid = 97016, price=28480},
{tid = 97017, price=28480},
{tid = 97018, price=28480},
{tid = 97019, price=63960},
{tid = 97020, price=63960},
{tid = 97021, price=63960},
{tid = 97022, price=2},
{tid = 97025, price=10},
{tid = 97028, price=50},
{tid = 97031, price=250},
{tid = 97032, price=250},
{tid = 97033, price=250},
{tid = 97034, price=1000},
{tid = 97035, price=1000},
{tid = 97036, price=1000},
{tid = 97037, price=3580},
{tid = 97038, price=3580},
{tid = 97039, price=3580},
{tid = 97040, price=12490},
{tid = 97041, price=12490},
{tid = 97042, price=12490},
{tid = 97043, price=28480},
{tid = 97044, price=28480},
{tid = 97045, price=28480},
{tid = 97046, price=63960},
{tid = 97047, price=63960},
{tid = 97048, price=63960},
{tid = 97049, price=2},
{tid = 97052, price=10},
{tid = 97055, price=50},
{tid = 97058, price=250},
{tid = 97059, price=250},
{tid = 97060, price=250},
{tid = 97061, price=1000},
{tid = 97062, price=1000},
{tid = 97063, price=1000},
{tid = 97064, price=3580},
{tid = 97065, price=3580},
{tid = 97066, price=3580},
{tid = 97067, price=12490},
{tid = 97068, price=12490},
{tid = 97069, price=12490},
{tid = 97070, price=28480},
{tid = 97071, price=28480},
{tid = 97072, price=28480},
{tid = 97073, price=63960},
{tid = 97074, price=63960},
{tid = 97075, price=63960},
{tid = 97076, price=2},
{tid = 97079, price=10},
{tid = 97082, price=50},
{tid = 97085, price=250},
{tid = 97086, price=250},
{tid = 97087, price=250},
{tid = 97088, price=1000},
{tid = 97089, price=1000},
{tid = 97090, price=1000},
{tid = 97091, price=3580},
{tid = 97092, price=3580},
{tid = 97093, price=3580},
{tid = 97094, price=12490},
{tid = 97095, price=12490},
{tid = 97096, price=12490},
{tid = 97097, price=28480},
{tid = 97098, price=28480},
{tid = 97099, price=28480},
{tid = 97100, price=63960},
{tid = 97101, price=63960},
{tid = 97102, price=63960},
{tid = 97103, price=2},
{tid = 97106, price=10},
{tid = 97109, price=50},
{tid = 97112, price=250},
{tid = 97113, price=250},
{tid = 97114, price=250},
{tid = 97115, price=1000},
{tid = 97116, price=1000},
{tid = 97117, price=1000},
{tid = 97118, price=3580},
{tid = 97119, price=3580},
{tid = 97120, price=3580},
{tid = 97121, price=12490},
{tid = 97122, price=12490},
{tid = 97123, price=12490},
{tid = 97124, price=28480},
{tid = 97125, price=28480},
{tid = 97126, price=28480},
{tid = 97127, price=63960},
{tid = 97128, price=63960},
{tid = 97129, price=63960},
{tid = 97134, price=2},
{tid = 97137, price=10},
{tid = 97140, price=50},
{tid = 97143, price=250},
{tid = 97144, price=250},
{tid = 97145, price=250},
{tid = 97146, price=1000},
{tid = 97147, price=1000},
{tid = 97148, price=1000},
{tid = 97149, price=3580},
{tid = 97150, price=3580},
{tid = 97151, price=3580},
{tid = 97152, price=12490},
{tid = 97153, price=12490},
{tid = 97154, price=12490},
{tid = 97155, price=28480},
{tid = 97156, price=28480},
{tid = 97157, price=28480},
{tid = 97158, price=63960},
{tid = 97159, price=63960},
{tid = 97160, price=63960},
}

KungFuSoulGrowthLvl = {
	{level = 0, price=0},
	{level = 1, price=154},
	{level = 2, price=308},
	{level = 3, price=462},
	{level = 4, price=616},
	{level = 5, price=770},
	{level = 6, price=924},
	{level = 7, price=1078},
	{level = 8, price=1233},
	{level = 9, price=1388},
	{level = 10, price=1553},
	{level = 11, price=1741},
	{level = 12, price=2004},
	{level = 13, price=2435},
	{level = 14, price=3279},
	{level = 15, price=5066},
	{level = 16, price=10000},
	{level = 17, price=28000},
}

function GetStonePrice()
    local ret_table = {}
    for k,v in pairs(StonePrice) do
       ret_table[#ret_table + 1] = v.tid
       ret_table[#ret_table + 1] = v.price
    end 
    return unpack(ret_table)
end

function GetKungFuPrice()
    local ret_table = {}
    for k,v in pairs(KungFuSoulGrowthLvl) do
       ret_table[#ret_table + 1] = v.level
       ret_table[#ret_table + 1] = v.price
    end 
    return unpack(ret_table)
end



RelevantInstance = {
	[3042] = {3043, 3044},
	[3043] = {3042, 3044},
	[3044] = {3042, 3043},
	[9950] = {3042, 3043, 3044},
}

function GetRelevantInstance(tid)
    local ret_table = {}
	if RelevantInstance[tid] ~= nil then
		ret_table = RelevantInstance[tid];
	end

    return unpack(ret_table)
end
RandomInstance = {
	[10281] = {10281},
}

function GetRandomInstance(tid)
    local ret_table = {}
	if RandomInstance[tid] ~= nil then
		ret_table = RandomInstance[tid];
	end

    return unpack(ret_table)
end

function GetBaiDuDynamicAwards()
     local values =
     {
        90,         --多少级是新手
        3,          --多少人才算新手队
        10510,      --奖励模板id
        2.0,        --副本基础掉落率
        2.0,        --新手队加成率
        90,         --新手队每日最大数量
        60          --非新手队每日最大数量
     }
    return unpack(values)
end

MergeCompensateConfig= 
{
	{zoneid = 20649, use_limit_tid = 10865, level_limit = 95, activity_tid = 10866, reward_tid = 10867},
	{zoneid = 2305, use_limit_tid = 10865, level_limit = 95, activity_tid = 10866, reward_tid = 10867},
	{zoneid = 20644, use_limit_tid = 10865, level_limit = 95, activity_tid = 10866, reward_tid = 10867},
	{zoneid = 20645, use_limit_tid = 10865, level_limit = 95, activity_tid = 10866, reward_tid = 10867},
	{zoneid = 2308, use_limit_tid = 10865, level_limit = 95, activity_tid = 10866, reward_tid = 10867},
}

function GetMergeCompensateConfig()
    local ret_table = {}
    for k,v in pairs(MergeCompensateConfig) do
       ret_table[#ret_table + 1] = v.zoneid
       ret_table[#ret_table + 1] = v.use_limit_tid
       ret_table[#ret_table + 1] = v.level_limit
       ret_table[#ret_table + 1] = v.activity_tid
       ret_table[#ret_table + 1] = v.reward_tid
    end 
    return unpack(ret_table)
end
CompensationKillMonsterVP =
{
    item_tid = 91253,
    vp_value = 50,
    begin_time = {year=2018, month=1, day=18, hour=8, min=0, sec=0}, 
    end_time = {year=2018, month=1, day=28, hour=8, min=0, sec=0}, 
}
function GetCompensationKillMonsterVP()
    local ret_table = {}
    ret_table[#ret_table + 1] = CompensationKillMonsterVP.item_tid;
    ret_table[#ret_table + 1] = CompensationKillMonsterVP.vp_value;
    ret_table[#ret_table + 1] = os.time(CompensationKillMonsterVP.begin_time);
    ret_table[#ret_table + 1] = os.time(CompensationKillMonsterVP.end_time);
    return unpack(ret_table)
end

FightValueParam = { 2.5, 0.78, 0.6, 1000000, 800 }

function GetFightValueParam()
	local ret_table = {}
	for k,v in pairs(FightValueParam) do
		ret_table[#ret_table + 1] = v
	end
    return unpack(ret_table)
end
