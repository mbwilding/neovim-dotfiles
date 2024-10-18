return {
  "shellRaining/hlchunk.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
      chunk = {
          enable = true,
      }
  },
}
