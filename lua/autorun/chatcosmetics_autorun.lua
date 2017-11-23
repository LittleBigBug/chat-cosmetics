chatcosmetics = {}
chatcosmetics.tags = {}

if SERVER then
  AddCSLuaFile("chatcosmetics/config.lua")
  AddCSLuaFile("chatcosmetics/cfutil.lua")
  AddCSLuaFile("chatcosmetics/client/chatmodify.lua")
  AddCSLuaFile("chatcosmetics/client/connectionstuff.lua")

  include("chatcosmetics/cfutil.lua")
  include("chatcosmetics/server/connectionstuff.lua")
elseif CLIENT then
  include("chatcosmetics/cfutil.lua")

  include("chatcosmetics/client/chatmodify.lua")
  include("chatcosmetics/client/connectionstuff.lua")
end
