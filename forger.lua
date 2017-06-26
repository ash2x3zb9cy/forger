-- todo: more arguments
local function new(enabled)
	if enabled == nil then enabled = true end
	local r = {
		isEnabled = enabled,
		messages = {"test"},
		log = log,
		draw = draw,
		font = love.graphics.newFont(12),
		amount = 5, -- number of messages to show
	}
	return r
end

function log(self, message)
	if type(message) == 'table' or type(message) == 'function' then
		self:print('forger error: attempted to print ' .. type(message))
		return
	end

	table.insert(self.messages, 1, message)
end

function draw(self)
	local oldfont = love.graphics.getFont()
	love.graphics.setFont(self.font)
	for i=1, math.min(#self.messages, self.amount) do
		local y = (math.min(self.amount, #self.messages)-i)*12
		love.graphics.print(self.messages[i], 0, y)
	end
	love.graphics.setFont(oldfont)
end

return {new = new}
