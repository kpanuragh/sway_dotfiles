return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "typescript-language-server",
        "intelephense",
        "json-lsp",
        "yaml-language-server",
        "phpactor",
      },
    },
  },
}
