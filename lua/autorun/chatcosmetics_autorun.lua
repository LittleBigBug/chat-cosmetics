chatcosmetics = {}
chatcosmetics.tags = {}

if SERVER then
  AddCSLuaFile("chatcosmetics/config.lua")
  AddCSLuaFile("chatcosmetics/cfutil.lua")
  AddCSLuaFile("chatcosmetics/client/chatmodify.lua")

  include("chatcosmetics/cfutil.lua")
elseif CLIENT then
  include("chatcosmetics/cfutil.lua")

  include("chatcosmetics/client/chatmodify.lua")
end
