local dap = require "dap"
dap.configurations.cpp =
{
  {
    name = "Launch",
    type = "cppdbg",
    request = "launch",
    program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    args = function()
        local input = vim.fn.input("Arguments: ", vim.fn.getcwd() .. "/", "file")
        return vim.split(input, " ", true)
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    runInTerminal = false,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'Enable GDB pretty printing',
        ignoreFailures = false
      }
    }
  },
}
dap.adapters.cppdbg =
{
    id = "cppdbg",
    type = "executable",
    command = "/usr/share/cpptools-debug/bin/OpenDebugAD7"
}
