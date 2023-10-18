local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  b.formatting.phpcsfixer,

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "javascript", "typescript" } }, 

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
  b.formatting.rustfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
