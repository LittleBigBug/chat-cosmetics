util.AddNetworkString("chatcosmetics.playerconn.tc")
util.AddNetworkString("chatcosmetics.playerdcon.tc")
util.AddNetworkString("chatcosmetics.playerinit.tc")

local function PlayerConnect(name)
  net.Start("chatcosmetics.playerconn.tc")
    net.WriteString(name)
  net.Broadcast()
end

local function PlayerInitialSpawn(ply)
  net.Start("chatcosmetics.playerinit.tc")
    net.WriteString(ply:Nick())
    net.WriteString(ply:SteamID())
  net.Broadcast()
end

local function PlayerDisconnected(ply)
  net.Start("chatcosmetics.playerdcon.tc")
    net.WriteEntity(ply)
  net.Broadcast()
end

hook.Add("PlayerDisconnected", "chatcosmetics.playerdisconnected", PlayerDisconnected)
hook.Add("PlayerInitialSpawn", "chatcosmetics.playerinitialspawn", PlayerInitialSpawn)
hook.Add("PlayerConnect", "chatcosmetics.playerconnect", PlayerConnect)
