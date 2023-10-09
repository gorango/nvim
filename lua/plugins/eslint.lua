return {
    "MunifTanjim/eslint.nvim",
    version = false,
    dependencies = {
        "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local eslint = require("eslint")
        null_ls.setup()
        eslint.setup({
            bin = 'eslint', -- or `eslint_d`
            code_actions = {
                enable = true,
                apply_on_save = {
                    enable = true,
                    types = { "directive", "problem", "suggestion", "layout" },
                },
                disable_rule_comment = {
                    enable = true,
                    location = "separate_line", -- or `same_line`
                },
            },
            diagnostics = {
                enable = true,
                report_unused_disable_directives = false,
                run_on = "type", -- or `save`
            },
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
                local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
                if client then
                    local diag = vim.diagnostic.get(event.buf,
                        { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                    if #diag > 0 then
                        vim.cmd("EslintFixAll")
                    end
                end
            end,
        })
    end,
}
