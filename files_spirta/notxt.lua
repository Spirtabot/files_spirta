--[[
BY : SPIRTATEAM
Channel Files : https://t.me/spirtaFiles
]]
local function zain_spirta(data)
    JSON = (loadfile  "./libs/dkjson.lua")()
    local msg = data.message_
    text = msg.content_.text_
    redis = (loadfile "./libs/redis.lua")()
    database = Redis.connect('127.0.0.1', 6379)
    sudos = dofile('sudo.lua')
    HTTPS = require("ssl.https")
    bot_id_zain = {string.match(token, "^(%d+)(:)(.*)")}
    bot_id = tonumber(bot_id_zain[1])
    local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
        local TextParseMode = {ID = "TextParseModeMarkdown"}
        tdcli_function ({
          ID = "SendMessage",
          chat_id_ = chat_id,
          reply_to_message_id_ = reply_to_message_id,
          disable_notification_ = disable_notification,
          from_background_ = 1,
          reply_markup_ = nil,
          input_message_content_ = {
          ID = "InputMessageText",
          text_ = text,
          disable_web_page_preview_ = disable_web_page_preview,
          clear_draft_ = 0,
          entities_ = {},
          parse_mode_ = TextParseMode,
          },
          }, dl_cb, nil)
          end
function is_mod(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('spirta:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('spirta:'..bot_id..'admins:', user_id)  
local owner = database:sismember('spirta:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('spirta:'..bot_id..'creator:'..chat_id, user_id)  
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local zain_add_sudo = redis:get('spirta:'..bot_id..'sudoo'..user_id..'')
if zain_add_sudo then var = true end
return var
end
if (text and text == 'قفل الكلمات السيئه' and is_mod(msg)) then 
send(msg.chat_id_, msg.id_, 1,"☑️┇تم قفل الكلمات السيئه", 1, 'html')
database:set("zain:bantext"..bot_id..msg.chat_id_,"zain")
end
if (text and text == 'فتح الكلمات السيئه' and is_mod(msg)) then
send(msg.chat_id_, msg.id_, 1,"☑️┇تم فتح الكلمات السيئه",1, 'html')
database:del("zain:bantext"..bot_id..msg.chat_id_)
end
local izain = database:get("zain:bantext"..bot_id..msg.chat_id_)
if (izain and izain == 'zain') then
if (not is_mod(msg) and text) then 
local zain = { -- the List By : t.me/r_rrt
        'عير',
        'كس',
        'كحبه', -- the List By : t.me/r_rrt
        'كساسه',
        'مناويج',
        'تنيجون',
        'سكسي',
        'xxnx',
        'XXNX',
        'xxxn',
        'XXXN',
        'كوسي',
        'عيري',
        'موجب',
        'سالب',
        'بلاع العير',
        'بلاع الكس',
        'مصاص الخصوه',
        'ابن الكس',
        'ابن العار',
        'ابن العاهره',
        'عاهره',
        'منيوج',
        'فرخ',
        'فروخ',
        'بلاع',
        'كواد',
        'كواده',
        'منيوجه',
        'سكس',
        'نجتهم',
        'بعصته',
        'بعصتهم',
        'ناجني',
        'نجته', -- the List By : t.me/r_rrt
        'بعصني',
        'عيري',
        'عيرك',
        'كسك',
        'fuck',
        'FUCK',
        'sexy',
        'SEXY',
        'نيج',
        'ناجونه',
        'نجناهم',
        'بعصناهم',
        'خصاوي',
        'عيوره',
        'كساسه',
        'طيزك',
        'طيزي',
        'كيري كن امك',
        'كيرى',
        'كيرى كن امك',
        'تنيج',
        'ناجوك',
        'بی ناموس',
        'کسکش',
        'كير خوار',
        'كسليس',
        'ننه گوزو',
        'ننه كسكش',
        'بی پدر',
        'پدر کونی',
        'كسننه',
        'جنده',
        'مادره جنده',
        'بي ناموس',
        'بي شرف',
        'كسننت',
        'بي پدر ومادر',
        'خواهر جنده',
        'ننه كونى',
        'پسر کونی',
        'کیرم تو مادرت',
        'کیرم تو خانوادت',-- the List By : t.me/r_rrt
        'پدر سگ',
        'پدر کونی',
        'خواهرت گاییدم',
        'مادرت گاییدم'
} -- the List By : t.me/r_rrt
function delete_msg(chatid,mid)
    tdcli_function ({
    ID="DeleteMessages",
    chat_id_=chatid,
    message_ids_=mid
    },
    dl_cb, nil)
end
for i,v in ipairs(zain) do
if text:match("^()("..v..")(.*)$") then 
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
end
    return {
        zain_spirta = zain_spirta,
    }
    --[[
    BY : SPIRTATEAM
    Channel Files : https://t.me/spirtaFiles
    ]]
    