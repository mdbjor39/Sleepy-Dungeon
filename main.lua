local Element = require 'element'

map = {}

place = 4

function love.load()

  for x = 1, 46 do

    map[x] = {}

    for y = 1, 34 do

      map[x][y] = Element:new('Void.png')

      map[x][y].x = (x - 1) * 16
      map[x][y].y = (y - 1) * 16

    end

  end

  local xp = love.math.random(1,45)
  local yp = love.math.random(1,33)

  local xa = love.math.random(4,8)
  local ya = love.math.random(4,8)

  local ds

  for x = 1, xa do

    x = x + xp

    for y = 1, ya do

      y = y + yp

      if x <= 46 and x > 0 and y <= 34 and y > 0 then

        map[x][y].img = love.graphics.newImage('Tile Floor.png')

      end

    end

  end

  local w = love.math.random(1,4)

  if w == 1 then

    ds = love.math.random(0, xa)

    x = xp + ds
    y = yp - 1

    map[x][y].img = love.graphics.newImage('Tile Door.png')

  elseif w == 2 then

    ds = love.math.random(0, ya)

    x = xp - 1
    y = yp + ds

    map[x][y].img = love.graphics.newImage('Tile Door.png')

  elseif w == 3 then

    ds = love.math.random(0, xa)

    x = xp + ds
    y = yp + ya + 1

    map[x][y].img = love.graphics.newImage('Tile Door.png')

  elseif w == 4 then

    ds = love.math.random(0, ya)

    x = xp + xa + 1
    y = yp + ds

    map[x][y].img = love.graphics.newImage('Tile Door.png')

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

end
