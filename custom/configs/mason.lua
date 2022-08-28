require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua","intelephense","html","cssls","tsserver","angularls","jsonls" },
    automatic_installation = true,
    run_on_start = true,
})

