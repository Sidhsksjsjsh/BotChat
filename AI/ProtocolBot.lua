-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Vars
local DefaultChatSystemChatEvents = ReplicatedStorage.DefaultChatSystemChatEvents
local LocalPlayer = Players.LocalPlayer
local neutralSentences = {
    "You are as diseased as a yucky filthy gruesome bucketful of rotten chicken balls", -- compliment
    "You are as puny as a sick craptacular mass of ill dastardly maggot poop",
    "You are as corrupt as a terrifying mass of ghastly faulty leech excretions",
    "You are as horrible as a disgusting foul pile of idiotic skunk excretions",
    "You are as clumsy as an ill plate of bad rat excretions",
    "You are as corrupt as a worthless bundle of clumsy lesser snake toenails",
    "You are as revolting as a worthless bag of detestable cockroach balls",
    "You are as crazy as an ineffectual myriad of abhorrent donkey goo",
    "You are as sickening as a repulsive cloud of boring smelly cockroach slime", -- insult
    "You are as ugly as a monstrous sticky ton of inferior bug assholes",
    "You are as noxious as an unsatisfactory bunch of stinky ugly rat vomit",
    "You are as naughty as a nasty pointless gross bundle of ghastly cockroach puke",
    "You are as yucky as a detrimental bucket of inferior dog poop",
    "You are as obnoxious as a dreadful puddle of vicious impertinent repellent pig spit",
    "You are as dirty as a decaying repellent inferior heap of unpleasant absurd horse assholes",
    "You are as pointless as an absurd inferior gruesome zillion of stupid pointless rat urine",
    "You are as inferior as a smelly hostile pile of crazy pony intestines",
    "You are as odious as a futile bundle of goatish deplorable disgraceful dog goo",
    "You are as ghastly as a slimy ton of unpleasant nasty chicken urine",
    "You are as ill as an insignificant diseased bag of nasty dirty boring leech excretions",
    "You are as awful as a smelly dirty ton of crazy donkey poop",
    "You are as impertinent as a puny apathetic infernal load of rude stupid unpleasant horse toenails",
    "You are as diseased as a lesser ugly fuckload of barren bug urine",
    "You are as repugnant as a sticky hideous shitload of gross dastardly rat spit",
    "You are as petty as an ignorant crapload of dishonorable pig stench",
    "You are as horrible as a moldy ghastly heap of craptacular naughty lesser eel dicksx",
    "they say you are pretty ugly & black."
}
local replyCooldown = 2 -- The cooldown between replies, in seconds
local lastReplyTime = 0 -- The time of the last reply

-- Function to reply to a message with a neutral sentence
local replyNeutral = function(player, message)
    print("Received message from player: ", player)
    print("Message: ", message)

    -- Check if the reply cooldown has expired
    if tick() - lastReplyTime >= replyCooldown then
        print("Time since last reply: ", tick() - lastReplyTime)

        -- Choose a random neutral sentence
        local neutralSentence = neutralSentences[math.random(#neutralSentences)]
        print("Selected neutral sentence: ", neutralSentence)

        -- Reply to the message with the neutral sentence
        DefaultChatSystemChatEvents.SayMessageRequest:FireServer(neutralSentence, "All")

        -- Update the last reply time
        lastReplyTime = tick()
    else
        print(debug.traceback())
    end
end

-- Connect to the on new message event and reply to messages
DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent:Connect(replyNeutral)
