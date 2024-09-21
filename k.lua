local t = {}
yMax = 9
xMax = 9
for i=1,yMax do
t[i] = {}
for j=1,xMax do
t[i][j] = 0
end
end
local w = fs.open("a.txt", "w")
w.write(textutils.serialise(t))
w.close()
