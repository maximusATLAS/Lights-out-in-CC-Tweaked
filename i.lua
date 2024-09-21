function Pos(...) term.setCursorPos(...) end
local r = fs.open("a.txt", "r")
dataTable = textutils.unserialise(r.readAll())
r.close()

function render()
x = 1
y = 1
term.clear()
for i=1,#dataTable do
for j=1,#dataTable[1] do
Pos(x,y)
state = dataTable[y][x]
if state == 0 then
print("O")
else
print("X")
end
x = x+1
end
y = y+1
x = 1
end
end

function click()
local newTable = {}
local event, button, x, y = os.pullEvent("mouse_click")
for i=1,#dataTable do
newTable[i] = {}
for j=1,#dataTable[1] do
state = dataTable[i][j]
if (i == y and j == x) or (i == y-1 and j == x) or (i == y+1 and j == x) or (i == y and j == x-1) or (i == y and j == x+1) then
state = -(state-1)
end
newTable[i][j] = state
end
end
local w = fs.open("a.txt", "w")
w.write(textutils.serialise(newTable))
w.close()
end

render()
click()
shell.run("o.lua")
