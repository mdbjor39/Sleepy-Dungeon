local Element = {}

function Element:new(img)
  local element = {
    x = 0,
    y = 0,
  }
  if type(img) == 'string' then
    element.img = love.graphics.newImage(img)
  else
    element.img = img;
  end
  setmetatable(self, element)
  self.__index = self
  return element
end

return Element