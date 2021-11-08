local M = {}

M.config = function()
    vim.g.dashboard_default_executive = "telescope"
    vim.g.dashboard_custom_section = {
        a = {description = {"  Find File                 SPC f f"}, command = "Telescope find_files"},
        b = {description = {"  Recents                   SPC f o"}, command = "Telescope oldfiles"},
        c = {description = {"  Find Word                 SPC g r"}, command = "Telescope live_grep"},
        d = {description = {"洛 New File                         "}, command = "DashboardNewFile"},
        e = {description = {"  Bookmarks                        "}, command = "Telescope marks"},
        f = {description = {"  Load Last Session                "}, command = "SessionLoad"},
        g = {description = {"  Change Colorscheme               "}, command = "Telescope colorscheme"}
    }
end

return M
