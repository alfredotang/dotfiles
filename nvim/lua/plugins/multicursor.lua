-- keys moved off <leader>n/s/x/a, which LazyVim already uses
return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  event = "VeryLazy",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set
    -- like VSCode Ctrl-d: add cursor at next match of word/selection
    set({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end, { desc = "Add cursor at next match" })
    set({ "n", "x" }, "<leader>ms", function() mc.matchSkipCursor(1) end, { desc = "Skip match" })
    set({ "n", "x" }, "<leader>mA", mc.matchAllAddCursors, { desc = "Add cursors at all matches" })
    set({ "n", "x" }, "<leader>mj", function() mc.lineAddCursor(1) end, { desc = "Add cursor below" })
    set({ "n", "x" }, "<leader>mk", function() mc.lineAddCursor(-1) end, { desc = "Add cursor above" })
    -- gaip = cursor on every line of paragraph / visual selection
    set({ "n", "x" }, "ga", mc.addCursorOperator, { desc = "Add cursors (operator)" })
    set("n", "<c-leftmouse>", mc.handleMouse)
    set("n", "<c-leftdrag>", mc.handleMouseDrag)
    set("n", "<c-leftrelease>", mc.handleMouseRelease)

    -- only active while multiple cursors exist
    mc.addKeymapLayer(function(layerSet)
      layerSet({ "n", "x" }, "<left>", mc.prevCursor)
      layerSet({ "n", "x" }, "<right>", mc.nextCursor)
      layerSet({ "n", "x" }, "<leader>mx", mc.deleteCursor)
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)
  end,
}
