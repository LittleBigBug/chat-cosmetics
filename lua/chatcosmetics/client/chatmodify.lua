local cfg = include("chatcosmetics/config.lua")

local function chatTags(ply, msg, isteam, dead, prefix) -- Col1 is the team color, col2 is literally just white, useless.
  local tbl = {}
  if not ply:IsPlayer() then
    for k, v in pairs(cfg.ConsoleMessage(msg)) do
      tbl[#tbl+1] = v
    end

    chat.AddText(unpack(tbl))
    return true
  else
    local tags = chatcosmetics.getTags(ply)
    local ptag = chatcosmetics.getTagWithMostPriority(tags)

    local chatColor = cfg.ChatColor
    local nameColor = team.GetColor(ply:Team()) or Color(255, 255, 255)
    tbl[#tbl+1] = nameColor

    if ptag.chatcolor ~= nil then
      chatColor = ptag.chatcolor
    end

    -- Darkrp is special
    if GAMEMODE.FolderName == "darkrp" then
      if prefix ~= nil then
        if string.sub(prefix, 1, 8) == "[Advert]" then -- is an advert message
          if ptag.advertcolor ~= nil then
            chatColor = ptag.advertcolor
          else
            chatColor = cfg.AdvertColor
          end

          if cfg.Advert ~= "" then
            prefix = cfg.Advert .. " " .. ply:Nick()
          end
        elseif string.sub(prefix, 1, 5) == "(OOC)" then -- is an out of character message
          if ptag.ooccolor ~= nil then
            chatColor = ptag.ooccolor
          else
            chatColor = cfg.OOCColor
          end

          if cfg.OOC ~= "" then
            prefix = cfg.OOC .. " " .. ply:Nick()
          end
        end
      end

      for _, tag in pairs(tags) do
        if not tag.suffix then
          for _, p in pairs(tag.tag) do
            tbl[#tbl+1] = p
          end
          tbl[#tbl+1] = " "
        end
      end

      tbl[#tbl+1] = nameColor
      tbl[#tbl+1] = prefix
    else
      if dead then
        for k, v in pairs(cfg.Dead) do
          tbl[#tbl+1] = v
        end
        tbl[#tbl+1] = " "
      end

      if isteam then
        for k, v in pairs(cfg.Team) do
          tbl[#tbl+1] = v
        end
        tbl[#tbl+1] = " "
      end

      for _, tag in pairs(tags) do
        if not tag.suffix then
          for _, p in pairs(tag.tag) do
            tbl[#tbl+1] = p
          end
          tbl[#tbl+1] = " "
        end
      end

      tbl[#tbl+1] = nameColor
      tbl[#tbl+1] = ply:Nick()
    end

    for _, tag in pairs(tags) do
      if tag.suffix then
        tbl[#tbl+1] = " "
        for _, p in pairs(tag.tag) do
          tbl[#tbl+1] = p
        end
      end
    end

    tbl[#tbl+1] = Color(255, 255, 255)
    tbl[#tbl+1] = ": "
    tbl[#tbl+1] = chatColor
    tbl[#tbl+1] = msg

    chat.AddText(unpack(tbl))

    return true
  end
end

timer.Simple( 5, function()
  hook.Add("OnPlayerChat", "chatcosmetics.hijack.playerchat", chatTags)
end )
