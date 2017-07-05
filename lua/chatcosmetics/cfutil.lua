function chatcosmetics.addTag(tagdata)
  chatcosmetics.tags[#chatcosmetics.tags+1] = tagdata
end

function chatcosmetics.getTagWithMostPriority(tags)
  local cp = -1 -- Current priority
  local tag = nil
  if tags ~= nil then
    for k, v in pairs(tags) do
      if v.priority > cp then
        cp = v.priority
        tag = v
      end
    end
  end
  return tag
end

function chatcosmetics.getTags(player)
  local tags = {}
  for k, v in pairs(chatcosmetics.tags) do
    local isplayerstag = false
    for _, id in pairs(v.players) do
      if player:SteamID() == id or player:GetNWString('usergroup') == id then
        isplayerstag = true
      end
    end
    if isplayerstag then
      tags[#tags+1] = v
    end
  end
  return tags
end
