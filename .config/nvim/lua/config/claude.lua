local M = {}

-- Headless: run a project slash command via `claude -p`, results go to quickfix
local function run_command(command)
    vim.notify("Claude: running " .. command)
    vim.system({ "claude", "-p", command }, { text = true }, function(r)
        vim.schedule(function()
            vim.fn.setqflist({}, "r", {
                title = "Claude " .. command,
                lines = vim.split(r.stdout, "\n", { trimempty = true }),
                efm = "%f:%l: %m",
            })
            vim.cmd.copen()
        end)
    end)
end

M.config = function()
    require("claudecode").setup({})
end

M.run_command = run_command

return M
