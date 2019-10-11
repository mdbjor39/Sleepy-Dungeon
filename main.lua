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

  local roomStartx = love.math.random(45,81)
  local roomStarty = love.math.random(45,69)

  local roomWidth = love.math.random(4,8)
  local roomHeight = love.math.random(4,8)

  local doorSide
  local newDoorSide

  local doorPosition

  local roomPosition

  for x = roomStartx, roomStartx + roomWidth do

    for y = roomStarty + 1, roomStarty + roomHeight do

      map[x][y].img = love.graphics.newImage('Tile Floor.png')

    end

  end

  ------------------------

  --Select side to place door

  doorSide = love.math.random(1,4)

  debugs = doorSide

  --for redo = 1, 2 do

    debug = newDoorSide

    if doorSide == 1 then

      doorPosition = love.math.random(1, roomWidth)

      x = roomStartx + doorPosition
      y = roomStarty

      map[x][y].img = love.graphics.newImage('Tile Door.png')

      roomWidth = love.math.random(4,8)
      roomHeight = love.math.random(4,8)

      roomStartx = x
      roomStarty = y

      roomPosition = love.math.random(0, roomWidth)

      for x = roomStartx - roomPosition, roomStartx + roomWidth - roomPosition do

        for y = roomStarty - roomHeight, roomStarty - 1 do

          map[x][y].img = love.graphics.newImage('Tile Floor.png')

        end

      end

      newDoorSide = love.math.random(1, 3)

      if newDoorSide == 1 then

        doorSide = 1

      elseif newDoorSide == 2 then

        doorSide = 2

      elseif newDoorSide == 3 then

        doorSide = 4

      end

    elseif doorSide == 2 then

      doorPosition = love.math.random(1, roomHeight)

      x = roomStartx - 1
      y = roomStarty + doorPosition

      map[x][y].img = love.graphics.newImage('Tile Door.png')

      roomWidth = love.math.random(4,8)
      roomHeight = love.math.random(4,8)

      roomStartx = x
      roomStarty = y

      roomPosition = love.math.random(0, roomHeight)

      for x = roomStartx - roomWidth, roomStartx - 1 do

        for y = roomStarty - roomPosition, roomStarty + roomHeight - roomPosition do

          map[x][y].img = love.graphics.newImage('Tile Floor.png')

        end

      end

      newDoorSide = love.math.random(1, 3)

      if newDoorSide == 1 then

        doorSide = 1

      elseif newDoorSide == 2 then

        doorSide = 2

      elseif newDoorSide == 3 then

        doorSide = 3

      end

    elseif doorSide == 3 then

      doorPosition = love.math.random(1, roomWidth)

      x = roomStartx + doorPosition
      y = roomStarty + roomHeight + 1

      map[x][y].img = love.graphics.newImage('Tile Door.png')

      roomWidth = love.math.random(4,8)
      roomHeight = love.math.random(4,8)

      roomStartx = x
      roomStarty = y

      roomPosition = love.math.random(0, roomWidth)

      for x = roomStartx - roomPosition, roomStartx + roomWidth - roomPosition do

        for y = roomStarty + 1, roomStarty + roomHeight do

          map[x][y].img = love.graphics.newImage('Tile Floor.png')

        end

      end

      newDoorSide = love.math.random(1, 3)

      if newDoorSide == 1 then

        doorSide = 2

      elseif newDoorSide == 2 then

        doorSide = 3

      elseif newDoorSide == 3 then

        doorSide = 4

      end

    elseif doorSide == 4 then

      doorPosition = love.math.random(1, roomHeight)

      x = roomStartx + roomWidth + 1
      y = roomStarty + doorPosition

      map[x][y].img = love.graphics.newImage('Tile Door.png')

      roomWidth = love.math.random(4,8)
      roomHeight = love.math.random(4,8)

      roomStartx = x
      roomStarty = y

      roomPosition = love.math.random(0, roomHeight)

      for x = roomStartx + 1, roomStartx + roomWidth do

        for y = roomStarty - roomPosition, roomStarty + roomHeight - roomPosition do

          map[x][y].img = love.graphics.newImage('Tile Floor.png')

        end

      end

      newDoorSide = love.math.random(1, 3)

      if newDoorSide == 1 then

        doorSide = 1

      elseif newDoorSide == 2 then

        doorSide = 3

      elseif newDoorSide == 3 then

        doorSide = 4

      end

    end

  --end

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

  --love.graphics.print(debug, 10, 0)
  love.graphics.print(debugs, 0, 0)

end
