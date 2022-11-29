local function print_num(a)
  print(a)
end

or

local print_num = function(a)
  print(a)
end

print_num(5) -- prints 5 

-- multiple parameters

function sum(a, b)
  return a + b
end
