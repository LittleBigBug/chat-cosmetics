-- Chat Cosmetics Created and Developed by LittleBigBug
-- http://www.steamcommunity.com/id/littlebigbug
-- All Rights reserved
-- Specially developed for Aero Game Servers
-- Aerogameservers.com
-- Don't edit here.
-- Please use sh_config to change chat tags.


include("autorun/sh_config.lua")

local function AddChatTags( ply, msg, Team, dead, prefixText, col1, col2 )

		if maestro ~= nil then

			local tag = CUConfig.Tags[ maestro.userrank( ply ) ]

		else

			local tag = CUConfig.Tags[ply:GetNWString("usergroup")]

		end

		local text = {}
		local table = table
		local color_white = color_white


		local text = {}
		local tag = CUConfig.Tags[ply:GetNWString("usergroup")]
		local table = table
		local color_white = color_white

		local ctag = CUConfig.CustomTag

		if ctag.Enabled then

			if ctag.SteamIDs[ply:SteamID()] then

				table.insert( text, ctag.BracketsColour )
				table.insert( text, ctag.BracketLeft )
				table.insert( text, ctag.Colour )
				table.insert( text, ctag.Name )
				table.insert( text, ctag.BracketsColour )
				table.insert( text, ctag.BracketRight )

			end

		end

		if tag ~= nil then

			table.insert( text, tag[3] )
			table.insert( text, CUConfig.BracketLeft )
			table.insert( text, tag[1] )
			table.insert( text, tag[2] )
			table.insert( text, tag[3] )
			table.insert( text, CUConfig.BracketRight )

		end

		Colour = team.GetColor( ply:Team() )

		table.insert( text, Colour)

		Chatcolor = color_white

		if tag ~= nil then

			if tag[4] ~= false then

				Chatcolor = tag[4]

			end

		end

		if GAMEMODE.FolderName == "darkrp" then

			if string.find(prefixText, "Advert") then

				Chatcolor = CUConfig.AdvertChatColor

			end

			table.insert( text, col1 )
			table.insert( text, prefixText )
			table.insert( text, col2 )
			table.insert( text, color_white)
			table.insert( text, ": " )
			table.insert( text, Chatcolor )
			table.insert( text, msg )

		else

			if Team then

				table.insert( text, Color(0, 255, 50) )
				table.insert( text, "[Team] ")
				table.insert( text, Colour)

			end

			if not ply:Alive() then

				table.insert( text, Color(255, 50, 50) )
				table.insert( text, "-Dead- ")
				table.insert( text, Colour)

			end

			table.insert( text, col1 )
			table.insert( text, col2 )
			table.insert( text, ply:GetName() )
			table.insert( text, color_white)
			table.insert( text, ": " )
			table.insert( text, Chatcolor )
			table.insert( text, msg )

		end

		chat.AddText( unpack( text ) )

		return true

end
hook.Add( "OnPlayerChat", "DarkRPChatTags", AddChatTags )
