local GAMES = {}

local GAMES_BY_UNIVERSE = {
    [10039889230] = {
        "FishingMaster",
        "https://vxezestudio.online/api/scripts/script_gLSmSrzXRaJoJ/stream/init"
    }
}

local entry = GAMES[game.PlaceId] or GAMES_BY_UNIVERSE[game.GameId]
local game_name = entry and entry[1]
local loader_url = entry and entry[2]

if loader_url then
    loadstring(game:HttpGet(loader_url))()
else
    warn("Game không được hỗ trợ: " .. tostring(game.GameId))
end
