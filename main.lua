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

  local xHolder
  local yHolder

  local FloorSide
  local newFloorSide

  local FloorPosition

  local roomPosition

  for x = roomStartx, roomStartx + roomWidth do

    for y = roomStarty + 1, roomStarty + roomHeight do

      map[x][y].img = love.graphics.newImage('Tile Floor.png')

    end

  end

  ------------------------

  --Select side to place Floor

  FloorSide = love.math.random(1, 4)

  for redo = 1, 4 do

    if FloorSide == 1 then

      FloorPosition = love.math.random(1, roomWidth)

      x = roomStartx + FloorPosition
      y = roomStarty

      map[x][y].img = love.graphics.newImage('Tile Floor.png')

      roomWidth = love.math.random(4,8)
      roomHeight = love.math.random(4,8)

      xHolder = x
      yHolder = y

      roomPosition = love.math.random(0, roomWidth)

      roomStartx = x - roomPosition
      roomStarty = y - roomHeight - 1

      for x = xHolder - roomPosition, xHolder + roomWidth - roomPosition do

        for y = yHolder - roomHeight, yHolder - 1 do

          map[x][y].img = love.graphics.newImage('Tile Floor.png')

        end

      end

      newFloorSide = love.math.random(1, 3)

      if newFloorSide == 1 then

        FloorSide = 1

      elseif newFloorSide == 2 then

        FloorSide = 2

      elseif newFloorSide == 3 then

        FloorSide = 4

      end

    elseif FloorSide == 2 then

      FloorPosition = love.math.random(1, roomHeight)

      x = roomStartx - 1
      y = roomStarty + FloorPosition

      map[x][y].img = love.graphics.newImage('Tile Floor.png')

      roomWidth = love.math.random(4,8)
      roomHeight = love.math.random(4,8)

      xHolder = x
      yHolder = y

      roomPosition = love.math.random(0, roomHeight)

      roomStartx = x - roomWidth - 1
      roomStarty = y - roomPosition

      for x = xHolder - roomWidth - 1, xHolder - 1 do

        for y = yHolder - roomPosition, yHolder + roomHeight - roomPosition do

          map[x][y].img = love.graphics.newImage('Tile Floor.png')

        end

      end

      newFloorSide = love.math.random(1, 3)

      if newFloorSide == 1 then

        FloorSide = 1

        roomStarty = roomStarty - 1

      elseif newFloorSide == 2 then

        FloorSide = 2

      elseif newFloorSide == 3 then

        FloorSide = 3

      end

    elseif FloorSide == 3 then

      FloorPosition = love.math.random(1, roomWidth)

      x = roomStartx + FloorPosition
      y = roomStarty + roomHeight + 1

      map[x][y].img = love.graphics.newImage('Tile Floor.png')

      roomWidth = love.math.random(4,8)
      roomHeight = love.math.random(4,8)

      xHolder = x
      yHolder = y

      roomPosition = love.math.random(0, roomWidth)

      roomStartx = x - roomPosition
      roomStarty = y

      for x = xHolder - roomPosition, xHolder + roomWidth - roomPosition do

        for y = yHolder + 1, yHolder + roomHeight do

          map[x][y].img = love.graphics.newImage('Tile Floor.png')

        end

      end

      newFloorSide = love.math.random(1, 3)

      if newFloorSide == 1 then

        FloorSide = 2

      elseif newFloorSide == 2 then

        FloorSide = 3

      elseif newFloorSide == 3 then

        FloorSide = 4

      end

    elseif FloorSide == 4 then

      FloorPosition = love.math.random(1, roomHeight)

      x = roomStartx + roomWidth + 1
      y = roomStarty + FloorPosition

      map[x][y].img = love.graphics.newImage('Tile Floor.png')

      roomWidth = love.math.random(4,8)
      roomHeight = love.math.random(4,8)

      xHolder = x
      yHolder = y

      roomPosition = love.math.random(0, roomHeight)

      roomStartx = x + 1
      roomStarty = y - roomPosition

      for x = xHolder + 1, xHolder + roomWidth do

        for y = yHolder - roomPosition, yHolder + roomHeight - roomPosition do

          map[x][y].img = love.graphics.newImage('Tile Floor.png')

        end

      end

      newFloorSide = love.math.random(1, 3)

      if newFloorSide == 1 then

        FloorSide = 1
        roomStarty = roomStarty - 1

      elseif newFloorSide == 2 then

        FloorSide = 3

      elseif newFloorSide == 3 then

        FloorSide = 4

      end

    end

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

end
