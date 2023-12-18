vim.api.nvim_create_user_command("CMakeBuild",
  function(opts)
    require("toggleterm").exec("cmake -G Ninja -S . -B " ..
      opts.fargs[1] .. " -D CMAKE_BUILD_TYPE=" .. opts.fargs[1] .. " && ninja -C " ..
      opts.fargs[1] .. " && ln -sf " .. opts.fargs[1] .. "/compile_commands.json .");
  end,
  {
    nargs = 1,
    ---@diagnostic disable-next-line: unused-local
    complete = function(ArgLead, CmdLine, CursorPos)
      return { "Debug", "Release" }
    end,
  })
