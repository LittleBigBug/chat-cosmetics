-- Chat Cosmetics by LittleBigBug
-- Thanks Zerf! <3

CUConfig = {}

if SERVER then

  AddCSLuaFile( 'chatcosmetics/cl_chatmodifier.lua' )
  AddCSLuaFile( 'chatcosmetics/sh_chatuother.lua' )
  AddCSLuaFile( 'chatcosmetics/sh_chatconfig.lua' )
  
  include( 'cahtcosmetics/sh_chatuother.lua' )
  include( 'chatcosmetics/sh_chatconfig.lua' )
  
else

  include( 'cahtcosmetics/sh_chatuother.lua' )
  include( 'chatcosmetics/sh_chatconfig.lua' )
  include( 'chatcosmetics/cl_chatmodifier.lua' )

end
