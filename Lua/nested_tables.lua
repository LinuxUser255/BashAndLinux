-- Nested lists
local data = {
    { "Sid", 20 },
    { "Tim", 90 },
}

for i = 1, #data do
  print(data[i][1] .. " is " .. data[i][2] .. " years old")
end

-- Nested dictionaries
local data = {
    sid = { age = 20 },
    time = { age = 90 },
}
