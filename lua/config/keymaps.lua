-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- F5 to Save and Run C++ or Python
--
--
--
--
--
--
-- Add any additional keymaps here
--
--
-- -- F5 to Save and Run C++ or Python (Fixed Path Version)
-- F5 to Save and Run (Wait for input version)
vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")
  local file = vim.fn.expand("%:p")
  local ft = vim.bo.filetype
  local output = vim.fn.expand("%:p:r")

  local cmd = ""
  if ft == "python" then
    -- 'read' waits for you to press Enter before closing
    cmd = "python3 " .. file .. "; echo -e '\n--- Process Finished ---\nPress Enter to close'; read"
  elseif ft == "cpp" then
    -- Compile and then run, followed by 'read'
    cmd = "g++ -std=c++20 "
      .. file
      .. " -o "
      .. output
      .. " && "
      .. output
      .. "; echo -e '\n--- Process Finished ---\nPress Enter to close'; read"
  elseif ft == "c" then
    cmd = "gcc "
      .. file
      .. " -o "
      .. output
      .. " && "
      .. output
      .. "; echo -e '\n--- Process Finished ---\nPress Enter to close'; read"
  else
    vim.notify("F5 run not configured for " .. ft, vim.log.levels.WARN)
    return
  end

  Snacks.terminal(cmd, {
    win = {
      position = "float",
      width = 0.8,
      height = 0.8,
      title = " 🚀 Running: " .. vim.fn.expand("%:t") .. " ",
      title_pos = "center",
    },
  })
end, { desc = "Save and Run File (F5)" })
