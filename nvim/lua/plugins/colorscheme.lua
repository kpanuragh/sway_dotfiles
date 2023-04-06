return {
  -- add gruvbox
  { "olivercederborg/poimandres.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "poimandres",
    },
  }
}
