--[[
  Usage: lua convert.lua "input-folder" "output-folder"
--]]

local input_folder = arg[1]
local output_folder = arg[2]
local log_file = "convert.log"
local PATHSEP = package.config:sub(1,1)

-- Additional ffmpeg parameters
local extra_ffmpeg_params = "-c:v libx264 -preset medium -crf 25 -c:a aac -b:a 128k"

if not input_folder or not output_folder then
  print("Usage: lua convert.lua <input_folder> <output_folder>")
  os.exit(1)
end

-- Log function
local function log(msg)
  print(msg)
  local f = io.open(log_file, "a")
  if f then
    f:write(os.date("[%Y-%m-%d %H:%M:%S] ") .. msg .. "\n")
    f:close()
  end
end

-- find all AVI files in folder and return a table
local function get_avi_files(folder)
  local files = {}
  local p = io.popen('dir "'..folder..'\\*.avi" /b')
  for file in p:lines() do
    table.insert(files, file)
  end
  p:close()
  return files
end

-- Extract date/time from filename
-- which will be used for mp4 metadata
local function parse_creation_time(filename)
  -- Example: aufnahme.2007-06-17_10-41.00.avi
  local date, time = filename:match("aufnahme%.([%d%-]+)_([%d%-%.]+)%.avi")
  if date and time then
    time = time:gsub("-", ":"):gsub("%.", ":")
    return date .. "T" .. time
  end
  return nil
end

-- does file exist?
local function file_exists(path)
  local f = io.open(path, "r")
  if f then f:close() return true end
  return false
end

-- for measuring time
local function now()
  return os.clock()
end

-- Main logic
local files = get_avi_files(input_folder)
if #files == 0 then
  log("No AVI files found in input folder.")
  os.exit(0)
end

local function ensure_dir_exists(path)
  -- Create folder if not exists
  os.execute('mkdir "' .. path .. '"')
end

-- Execute a ffmpeg command using pcall
local function safe_execute(ffmpeg_cmd)
  local ok, err = pcall(function()
    local result1, result2, result3 = os.execute(ffmpeg_cmd)
    if not (result1 == true or result1 == 0) then
      error("Error: ffmpeg result " .. tostring(result1))
    end
  end)
  return ok
end

-- Output folder
ensure_dir_exists(output_folder)

-- Overall processing time
local pstart_time = now()

-- Main loop over all AVI files
for _, file in ipairs(files) do
  local full_input_path = input_folder .. PATHSEP .. file
  local creation_time = parse_creation_time(file)
  local output_file = file:gsub("%.avi$", ".mp4")
  local full_output_path = output_folder .. PATHSEP .. output_file

  if file_exists(full_output_path) then
    log("Skip existing file: " .. output_file)
  elseif creation_time then
    local ffmpeg_cmd = string.format(
      'ffmpeg -loglevel quiet -y -i "%s" -filter:v "bwdif=mode=send_field:parity=auto:deint=all" -metadata creation_time="%s" %s "%s"',
      full_input_path, creation_time, extra_ffmpeg_params, full_output_path
    )

    log("Start processing: " .. file)
    local start_time = now()
    local ok = safe_execute(ffmpeg_cmd)
    local end_time = now()
    local duration = string.format("%.2f", end_time - start_time)

    if ok then
      log("Done: " .. file .. " (Duration: " .. duration .. " seconds)")
    else
      log("Error")
    end
  else
    log("Warn: Could not extract date: " .. file)
  end
end

local pduration = string.format("%.2f", now() - pstart_time)
log("Processing finished. Duration " .. pduration)
