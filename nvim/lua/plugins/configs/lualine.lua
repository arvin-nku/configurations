local function datetime()
  return os.date("%d.%m.%Y - %H:%M:%S")
end

local config = function()
        require("lualine").setup({
                options = {
                        theme = "auto",
                        globalstatus = true,
                        component_separators = { left = "|", right = "|" },
                        section_separators = { left = "", right = "" },
                },
                sections = {
                  lualine_a = { 'mode' },
                  lualine_b = { 'branch' },
                  lualine_c = { {
                    'filename',
                    file_status = true, -- displays file status (readonly status, modified status)
                    path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
                  } },
                  lualine_x = {
                    { 'diagnostics', sources = { "nvim_diagnostic" }, 
                      symbols = { error = ' ', warn = ' ', info = ' ',
                      hint = ' ' } },
                    'filesize',
                    datetime -- custom datetime function
                  },
                  lualine_y = { 'progress' },
                  lualine_z = { 'location' },
                },
                inactive_sections = {
                  lualine_a = {},
                  lualine_b = {},
                  lualine_c = { {
                    'filename',
                    file_status = true, -- displays file status (readonly status, modified status)
                    path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
                  } },
                  lualine_x = { 'location' },
                  lualine_y = {},
                  lualine_z = {},
                },
                tabline = {},
        })
end

return {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = config
}

