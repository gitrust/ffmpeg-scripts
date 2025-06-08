-- Specify a input folder
-- and a guess factor
local input_folder = arg[1]
local factor = tonumber(arg[2]) or 1.5  -- e.g. 1.5 of video length

if not input_folder then
  print("Usage: lua guess-duration.lua <folder> <factor>")
  os.exit(1)
end

print("Check folder " .. input_folder)

-- list all video files with extension in folder and put them
-- into referenced files table
local function list_video_files(files, folder, ext)
  local pattern = string.format('"%s\\*.%s"', folder, ext)
  local p = io.popen('dir ' .. pattern .. ' /b 2>nul')

  for file in p:lines() do
    print("Add file "..file)
    table.insert(files, file)
  end
  p:close()
end

-- get all video files from a folder (avi, mp4)
local function get_video_files(folder)
  local files = {}
  list_video_files(files, folder, "avi")
  list_video_files(files, folder, "mp4")
  return files
end

-- Extract video length with ffprobe (in seconds)
local function get_video_length(filepath)
  local cmd = string.format('ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "%s"', filepath)
  local f = io.popen(cmd)
  local duration = f:read("*a")
  f:close()
  return tonumber(duration)
end

-- Calculate duration
local total_length = 0
local files = get_video_files(input_folder)
for _, file in ipairs(files) do
  local fullpath = input_folder .. "\\" .. file
  local len = get_video_length(fullpath)
  if len then
    print(string.format("File: %s, Duration: %.2f seconds", file, len))
    total_length = total_length + len
  else
    print("Could not extract duration: " .. file)
  end
end

print(string.format("Duration of all videos: %.2f seconds (%.2f minutes)", total_length, total_length/60))

-- Konvertierdauer schätzen
local estimated_time = total_length * factor
print(string.format("Guessed conversion duration (factor %.2f): %.2f seconds (%.2f minutes)", factor, estimated_time, estimated_time/60))
