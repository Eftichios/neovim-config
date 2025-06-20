require("tokyonight").setup({
    style = "storm",

    on_colors = function(colors)
        colors.comment = "#78749a"
    end
})

function ColorMyPencils(color)
    color = color or "tokyonight-storm"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- line numbers
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#70826f"})
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#8ce386"})
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#70826f"})

end

ColorMyPencils()
