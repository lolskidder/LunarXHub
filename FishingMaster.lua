local GAMES = {}

local GAMES_BY_UNIVERSE = {
    [10039889230] = {
        "FishingMaster",
        "https://vxezestudio.online/api/scripts/script_I26KZ1w6qnq6M/stream/init"
    }
}

print("PlaceId:", game.PlaceId)
print("GameId:", game.GameId)

local entry = GAMES[game.PlaceId]
    or GAMES_BY_UNIVERSE[game.GameId]

if entry then
    local game_name = entry[1]
    local loader_url = entry[2]

    print("Game được hỗ trợ:", game_name)

    local success, err = pcall(function()
        local source = game:HttpGet(loader_url)
        assert(#source > 0, "Loader trả về nội dung rỗng")
        local fn = loadstring(source)
        assert(fn, "Không biên dịch được loader")
        fn()
    end)

    if not success then
        warn("Lỗi chạy loader:", err)
    end
else
    warn("Game không được hỗ trợ!")
    warn("GameId hiện tại:", game.GameId)
    warn("PlaceId hiện tại:", game.PlaceId)
end
