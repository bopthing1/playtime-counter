--This script will run on all levels when mod is active.
--Modding documentation: http://teardowngame.com/modding
--API reference: http://teardowngame.com/modding/api.html

--bopthing1

function init()
  timeAlreadySet = false

  playtime = {
    hours = 0,
    minutes = 0,
    seconds = 0
  }

  playtimeStrings = {
    hours = "",
    minutes = "",
    seconds = ""
  }
end

function tick(dt)
  if GetTime() and not timeAlreadySet then
    timeAlreadySet = true
    currentTime = GetTime()
  end

  if GetTime() > currentTime + 1 then
    clockThing()
    currentTime = GetTime()
  end
end

function getClockString()
  playtimeStrings["hours"] = playtime["hours"] .. ""
  if playtime["hours"] < 10 then
    playtimeStrings["hours"] = "0" .. playtimeStrings["hours"]
  end
  playtimeStrings["minutes"] = playtime["minutes"] .. ""
  if playtime["minutes"] < 10 then
    playtimeStrings["minutes"] = "0" .. playtimeStrings["minutes"]
  end
  playtimeStrings["seconds"] = playtime["seconds"] .. ""
  if playtime["seconds"] < 10 then
    playtimeStrings["seconds"] = "0" .. playtimeStrings["seconds"]
  end

  return playtimeStrings["hours"] .. ":" .. playtimeStrings["minutes"] .. ":" .. playtimeStrings["seconds"]
end

function clockThing()
  playtime["seconds"] = playtime["seconds"] + 1
  if playtime["seconds"] > 59 then
    playtime["seconds"] = 0
    playtime["minutes"] = playtime["minutes"] + 1
  end
  if playtime["minutes"] > 59 then
    playtime["minutes"] = 0
    playtime["hours"] = playtime["hours"] + 1
  end
end

function update(dt)
end

function draw(dt)
  UiFont("regular.ttf", 45)
  UiTranslate(100, 100)
  UiText(getClockString())
end
