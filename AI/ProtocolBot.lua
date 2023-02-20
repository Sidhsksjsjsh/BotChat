-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Vars
local DefaultChatSystemChatEvents = ReplicatedStorage.DefaultChatSystemChatEvents
local LocalPlayer = Players.LocalPlayer
local neutralSentences = {
    "i've always thought you have remarkably awe-inspiring buttocks", -- compliment
    "i must say: you have extraordinarily angelic muscles",
    "they say you are pretty delightful",
    "i reckon you have simply mind-blowing ideas",
    "i think you are insanely ravishing",
    "it's true, you are deeply divine",
    "i can't believe you are totally adorable",
    "i think you have extremely terrific eyebrows",
    "You are as sickening as a repulsive cloud of boring smelly cockroach slime", -- insult
    "You are as ugly as a monstrous sticky ton of inferior bug assholes",
    "You are as noxious as an unsatisfactory bunch of stinky ugly rat vomit",
    "You are as naughty as a nasty pointless gross bundle of ghastly cockroach puke",
    "You are as yucky as a detrimental bucket of inferior dog poop",
    "You are as obnoxious as a dreadful puddle of vicious impertinent repellent pig spit",
    "You are as dirty as a decaying repellent inferior heap of unpleasant absurd horse assholes"
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
