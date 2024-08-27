return {
  "CKolkey/ts-node-action",
  keys = {
    vim.keymap.set("n", "<leader>i", function()
      require("ts-node-action").node_action()
    end, { desc = "Run node action" })
  },
}