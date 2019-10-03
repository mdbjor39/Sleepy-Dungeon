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

  local roomStartx = 0
  local roomStarty = 6

  local roomWidth = 5
  local roomHeight = 5

  local doorSide = 1

  local doorPosition = 3

  for x = 1, roomWidth do

    x = x + roomStartx

    for y = 1, roomHeight do

      y = y + roomStarty

      if x <= 46 and x > 0 and y <= 34 and y > 0 then

        map[x][y].img = love.graphics.newImage('Tile Floor.png')

      end

    end

  end

  x = roomStartx + doorPosition
  y = roomStarty

  if x <= 46 and x > 0 and y <= 34 and y > 0 then

    map[x][y].img = love.graphics.newImage('Tile Door.png')

  end

  roomStartx = x
  roomStarty = y

  for x = 1, roomWidth do

    x = x

    for y = 1, roomHeight do

      y = roomStarty - y

      if x <= 46 and x > 0 and y <= 34 and y > 0 then

        map[x][y].img = love.graphics.newImage('Tile Floor.png')

      end

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
