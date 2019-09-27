local Element = require 'element'

map = {}

function love.load()
    for x = 1, 10 do
        map[x] = {}
        for y = 1, 10 do
            map[x][y] = Element:new('grass.png')
            --map[x][y].x = ???
            --map[x][y].y = ???
        end
    end
end


function love.update(dt)

end


function love.draw()
    for x = 1, #map do
        for y = 1, #map do
            love.graphics.draw(map[x][y].img, map[x][y].x, map[x][y].y, 0, 0.25)
        end
    end
end