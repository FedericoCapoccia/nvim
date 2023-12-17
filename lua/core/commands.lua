vim.api.nvim_create_user_command('CMakeDebug', function()
  require("toggleterm").exec(
    "cmake -G Ninja -S . -B Debug -D CMAKE_BUILD_TYPE=DEBUG && ninja -C Debug");
end, {})

vim.api.nvim_create_user_command('CMakeRelease', function()
  require("toggleterm").exec(
    "cmake -G Ninja -S . -B Release -D CMAKE_BUILD_TYPE=Release && ninja -C Release");
end, {})
