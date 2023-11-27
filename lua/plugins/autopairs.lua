return {
  "windwp/nvim-autopairs",
  dependencies = { "hrsh7th/nvim-cmp" }, -- optional
  config = function()
    require("nvim-autopairs").setup({})
    local cmp_autopairs = require("nvim-autopairs.completion.cmp") -- automatically add `(` after selecting a function or method
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
