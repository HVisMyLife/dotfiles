-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

local fortune = require("fortune").get_fortune()


M.base46 = { theme = "tokyodark" }
M.nvdash = {
    load_on_startup = true,
    header = {
          "                              ",
          "⠄⠄⠄⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄",
          "⠄⠄⠄⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄",
          "⠄⠄⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄",
          "⠄⠄⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄",
          "⠄⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰",
          "⠄⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤",
          "⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗",
          "⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠄",
          "⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠄",
          "⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃⠄",
          "⠄⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃⠄⠄",
          "⠄⠄⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁⠄⠄⠄",
          "⠄⠄⠄⠄⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁⠄⠄⠄⠄⠄",
          "⠄⠄⠄⠄⠄⠄⠄⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁⠄⠄⠄⠄⠄⢀⣠⣴",
          "⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿",
          "                              ",
          "      Powered By eovim      ",
          "                              ",
          "                              ",
    },

    buttons = {
      { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
      { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
      { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
      { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashFooter",
        no_gap = true,
      },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

      { txt = function ()
        if fortune[1] ~= nil then return fortune[1]
        else return "" end
      end, hl = "NvDashFooter", no_gap = true },
      { txt = function ()
        if fortune[2] ~= nil then return fortune[2]
        else return "" end
      end, hl = "NvDashFooter", no_gap = true },
      { txt = function ()
        if fortune[3] ~= nil then return fortune[3]
        else return "" end
      end, hl = "NvDashFooter", no_gap = true },
      { txt = function ()
        if fortune[4] ~= nil then return fortune[4]
        else return "" end
      end, hl = "NvDashFooter", no_gap = true },
      { txt = function ()
        if fortune[5] ~= nil then return fortune[5]
        else return "" end
      end, hl = "NvDashFooter", no_gap = true },
      { txt = function ()
        if fortune[6] ~= nil then return fortune[6]
        else return "" end
      end, hl = "NvDashFooter", no_gap = true },
      { txt = function ()
        if fortune[7] ~= nil then return fortune[7]
        else return "" end
      end, hl = "NvDashFooter", no_gap = true },
      { txt = function ()
        if fortune[8] ~= nil then return fortune[8]
        else return "" end
      end, hl = "NvDashFooter", no_gap = true },
      { txt = function ()
        if fortune[9] ~= nil then return fortune[9]
        else return "" end
      end, hl = "NvDashFooter", no_gap = true },
      { txt = function ()
        if fortune[10] ~= nil then return fortune[10]
        else return "" end
      end, hl = "NvDashFooter", no_gap = true },
    },
}

M.cheatsheet = {
  theme = "simple", -- simple/grid
  excluded_groups = { ":help" }, -- can add group name or with mode
}

return M
