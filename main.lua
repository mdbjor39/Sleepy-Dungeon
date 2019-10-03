local Element = require 'element'

map = {}

place = 4

function love.load()

-- Create whole drawable area

  for x = 1, 90 do

    map[x] = {}

    for y = 1, 90  do

      map[x][y] = Element:new('Void.png')

      map[x][y].x = (x - 45) * 16
      map[x][y].y = (y - 45) * 16

    end

  end

  ------------------------

  -- Create room

  local roomStartx = love.math.random(45,45)
  local roomStarty = love.math.random(45,45)

  local roomWidth = love.math.random(4,8)
  local roomHeight = love.math.random(4,8)

  local doorSide

  local doorPosition

  for x = 1, roomWidth do

    x = x + roomStartx

    for y = 1, roomHeight do

      y = y + roomStarty

      map[x][y].img = love.graphics.newImage('Tile Floor.png')

    end

  end

  ------------------------

  --Select side to place door

  doorSide = love.math.random(1,4)

  debug = doorSide

  ------------------------

  -- Creates Door
  if doorSide == 1 then

    doorPosition = love.math.random(1, roomWidth)

    x = roomStartx + doorPosition
    y = roomStarty

    map[x][y].img = love.graphics.newImage('Tile Door.png')

  elseif doorSide == 2 then

    doorPosition = love.math.random(1, roomHeight)

    x = roomStartx
    y = roomStarty + doorPosition

    map[x][y].img = love.graphics.newImage('Tile Door.png')

  elseif doorSide == 3 then

    doorPosition = love.math.random(1, roomWidth)

    x = roomStartx + doorPosition
    y = roomStarty + roomHeight + 1

    map[x][y].img = love.graphics.newImage('Tile Door.png')

  elseif doorSide == 4 then

    doorPosition = love.math.random(1, roomHeight)

    x = roomStartx + roomWidth + 1
    y = roomStarty + doorPosition

    map[x][y].img = love.graphics.newImage('Tile Door.png')

  end

  ------------------------

end


function love.update(dt)

end


function love.draw()

  for x = 1, 90 do

    for y = 1, 90 do

      love.graphics.draw(map[x][y].img, map[x][y].x, map[x][y].y, 0, 0.5)

    end

  end

  love.graphics.print(debug, 0, 0)

end
