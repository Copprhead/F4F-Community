local count = 0
local function counter()
	count = count + 1
	return count
end
-------DEVICE ID-------
devices = {}
devices["TEST"]						= counter()--1
devices["WEAPON_SYSTEM"]			= counter()--2
devices["ELECTRIC_SYSTEM"]			= counter()--3
devices["CLOCK"]					= counter()--4
devices["ADI"]						= counter()--5
devices["CANOPY"]					= counter()--6
devices["EXTANIM"]					= counter()--7
devices["FOLDING_WING"]					= counter()--8

