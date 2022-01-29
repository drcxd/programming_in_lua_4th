local s1 = [=[
<![CDATA[
  Hello world
]]>]=]

local s2 = "<![CDATA[\n\z
           \x20\x20Hello world\n\z
           ]]>"

local s3 = "<![CDATA[\n  Hello world\n]]>"

print(s1)

print(s2)

print(s3)

local mfc31
local mfc32
local mfc33
