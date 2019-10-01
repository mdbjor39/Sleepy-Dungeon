local Element = require 'element'

map = {}

place = 4

function love.load()


-- Create whole drawable area
  for x = 1, 46 do

    map[x] = {}

    for y = 1, 34 do

      map[x][y] = Element:new('Void.png')

      map[x][y].x = (x - 1) * 16
      map[x][y].y = (y - 1) * 16

    end

  end

  ------------------------

  local roomStartx = love.math.random(1,45)
  local roomStarty = love.math.random(1,33)

  local roomWidth = love.math.random(4,8)
  local roomHeight = love.math.random(4,8)

  local doorSide

  local doorPosition

  for x = 1, roomWidth do

    x = x + roomStartx

    for y = 1, roomHeight do

      y = y + roomStarty

      if x <= 46 and x > 0 and y <= 34 and y > 0 then

        map[x][y].img = love.graphics.newImage('Tile Floor.png')

      end

    end

  end

  doorSide = love.math.random(1,4)

  debug = doorSide

  if doorSide == 1 then

    doorPosition = love.math.random(1, roomWidth)

    x = roomStartx + doorPosition
    y = roomStarty

    if x <= 46 and x > 0 and y <= 34 and y > 0 then

      map[x][y].img = love.graphics.newImage('Tile Door.png')

    end

  elseif doorSide == 2 then

    doorPosition = love.math.random(1, roomHeight)

    x = roomStartx
    y = roomStarty + doorPosition

    if x <= 46 and x > 0 and y <= 34 and y > 0 then

      map[x][y].img = love.graphics.newImage('Tile Door.png')

    end

  elseif doorSide == 3 then

    doorPosition = love.math.random(1, roomWidth)

    x = roomStartx + doorPosition
    y = roomStarty + roomHeight + 1

    if x <= 46 and x > 0 and y <= 34 and y > 0 then

      map[x][y].img = love.graphics.newImage('Tile Door.png')

    end

  elseif doorSide == 4 then

    doorPosition = love.math.random(1, roomHeight)

    x = roomStartx + roomWidth + 1
    y = roomStarty + doorPosition

    if x <= 46 and x > 0 and y <= 34 and y > 0 then

      map[x][y].img = love.graphics.newImage('Tile Door.png')

    end

  end

end


function love.update(dt)

end


function love.draw()

  for x = 1, 46 do

    for y = 1, 34 do

      love.graphics.draw(map[x][y].img, map[x][y].x, map[x][y].y, 0, 0.5)

    end

  end

  love.graphics.print(debug, 0, 0)

end


function makeRoom()

  roomWidth = love.math.random(4,8)
  roomHeight = love.math.random(4,8)

  for x = 1, roomWidth do

    x = x + roomStartx

    for y = 1, roomHeight do

      y = y + roomStarty

      if x <= 46 and x > 0 and y <= 34 and y > 0 then

        map[x][y].img = love.graphics.newImage('Tile Floor.png')

      end

    end

  end

end
