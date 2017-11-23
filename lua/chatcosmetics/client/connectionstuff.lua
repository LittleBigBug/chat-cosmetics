-- A few things couldn't be tested with the situation im in. Just send a bug ticket

local cfg = include("chatcosmetics/config.lua")

local function uPackText(tb)
  chat.AddText(unpack(tb))
end

local function formatName(tb, name)
  if tb then
    for k, v in pairs(tb) do
      if type(v) == "string" and string.find(v, "%s") ~= nil then
        tb[k] = string.format(v, name)
      end
    end
  end
  uPackText(tb)
end

local function formatSteamID(steamid)
  local lp = LocalPlayer()
  if not IsValid(lp) then return end

  local st = false
  for _, id in pairs(cfg.SteamIDGroups) do
    if type(id) == "function" then
      st = id(lp)
    end

    if lp:SteamID() == id or lp:GetNWString('usergroup') == id then
      st = true
    end
  end

  if st then
    local tb = cfg.SteamIDMessage
    if tb and steamid then
      for k, v in pairs(tb) do
        if type(v) == "string" and string.find(v, "%s") ~= nil then
          tb[k] = string.format(v, steamid)
        end
      end
    end
    uPackText(tb)
  end
end

net.Receive("chatcosmetics.playerconn.tc", function(len)
  local name = net.ReadString()
  local tb = cfg.ConnectMessage
  formatName(tb, name)
end)

net.Receive("chatcosmetics.playerdcon.tc", function(len)
  local ply = net.ReadEntity()
  local name = ply:Nick()
  local tb = cfg.DisconnectMessage
  formatName(tb, name)
  formatSteamID(ply:SteamID())
end)

net.Receive("chatcosmetics.playerinit.tc", function(len)
  local name = net.ReadString()
  local steam = net.ReadString()
  local tb = cfg.SpawnMessage
  formatName(tb, name)
  formatSteamID(steam)
end)
