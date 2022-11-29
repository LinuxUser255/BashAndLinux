local info = { 
   name = "sid",
   age = 20,
   isAlive = true
}

-- both print sid
prrint(info["name"])
print(info.name)

-- Loop by pairs
for key, value in pairs(info) do
   print(key .. " " .. tostring(value))
end

-- prints name sid, age 20 etc
