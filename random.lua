function Pos(...) term.setCursorPos(...) end
local r = fs.open("a.txt", "r")
dataTable = textutils.unserialise(r.readAll())
r.close()

function click()
local newTable = {}
x = math.random(1,#dataTable[1])
y = math.random(1,#dataTable)
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

click()

