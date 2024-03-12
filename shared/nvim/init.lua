vim.g.mapleader = " "

local map = vim.keymap.set

local options = {
    noremap = true,
    silent = true
}

-- Check if VSCode extension is available
if vim.g.vscode then
    function ReplaceHoveredWord(mode)
        local hovered_word = vim.fn.expand("<cWORD>")
        print("Hovered Word:", hovered_word)
        local new_word = vim.fn.input("Replace '" .. hovered_word .. "' with: ")
        print("New Word:", new_word)
        if new_word and new_word ~= "" then
            local cmd_format = mode == "line" and "s" or "%%s"
            local command = string.format(cmd_format .. "/%s/%s/g", vim.fn.escape(hovered_word, "/\\"),
                vim.fn.escape(new_word, "/\\"))

            vim.cmd(command)
        end
    end

    map('n', '<Leader>rl', ':lua ReplaceHoveredWord("line")<Cr>', options)
    map('n', '<Leader>rf', ':lua ReplaceHoveredWord("file")<Cr>', options)

    -- Copy to system clipboard
    vim.cmd("set clipboard+=unnamedplus")

    -- Define key mappings for VSCode
    
    -- Workbench actions
    map('n', '<Leader>o', '<Cmd> call VSCodeNotify("workbench.action.quickOpen")<Cr>', options)
    map('n', '<Leader>p', '<Cmd> call VSCodeNotify("workbench.action.showCommands")<Cr>', options)
    
    -- Sidebar
    map('n', '<Leader>t', '<Cmd> call VSCodeNotify("workbench.action.toggleSidebarVisibility")<Cr>', options)
    
    -- Sidebar items
    map('n', '<Leader>g', '<Cmd> call VSCodeNotify("workbench.view.scm")<Cr>', options)
    map('n', '<Leader>e', '<Cmd> call VSCodeNotify("workbench.view.explorer")<Cr>', options)
    map('n', '<leader>f', '<Cmd> call VSCodeNotify("workbench.view.search")<Cr>', options)
    
    -- Editor group selection
    map ('n', '<Leader>1', '<Cmd>call VSCodeNotify("workbench.action.openEditorAtIndex1")<Cr>', options)
    map ('n', '<Leader>2', '<Cmd>call VSCodeNotify("workbench.action.openEditorAtIndex2")<Cr>', options)
    map ('n', '<Leader>3', '<Cmd>call VSCodeNotify("workbench.action.openEditorAtIndex3")<Cr>', options)
    map ('n', '<Leader>4', '<Cmd>call VSCodeNotify("workbench.action.openEditorAtIndex4")<Cr>', options)
    map ('n', '<Leader>5', '<Cmd>call VSCodeNotify("workbench.action.openEditorAtIndex5")<Cr>', options)
    map ('n', '<Leader>6', '<Cmd>call VSCodeNotify("workbench.action.openEditorAtIndex6")<Cr>', options)
    map ('n', '<Leader>7', '<Cmd>call VSCodeNotify("workbench.action.openEditorAtIndex7")<Cr>', options)
    map ('n', '<Leader>8', '<Cmd>call VSCodeNotify("workbench.action.openEditorAtIndex8")<Cr>', options)
    map ('n', '<Leader>9', '<Cmd>call VSCodeNotify("workbench.action.openEditorAtIndex9")<Cr>', options)

    map ('n', '<Leader>q', '<Cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<Cr>', options)

    -- Panes
    map('n', '<leader>h', '<Cmd> call VSCodeNotify("workbench.action.focusLeftGroup")<Cr>', options)
    map('n', '<leader>l', '<Cmd> call VSCodeNotify("workbench.action.focusRightGroup")<Cr>', options)
    map('n', '<leader>k', '<Cmd> call VSCodeNotify("workbench.action.focusAboveGroup")<Cr>', options)
    map('n', '<leader>j', '<Cmd> call VSCodeNotify("workbench.action.focusBelowGroup")<Cr>', options)

    map('n', '<leader>c', '<Cmd> call VSCodeNotify("workbench.action.terminal.toggleTerminal")<Cr>', options)

    -- Text editing actions
    map('n', '<', '<Cmd> call VSCodeCall("editor.action.outdentLines")<Cr>', options)
    map('n', '>', '<Cmd> call VSCodeCall("editor.action.indentLines")<Cr>', options)
    map('v', 'K', '<Cmd> call VSCodeCall("editor.action.moveLinesUpAction")<Cr>', options)
    map('v', 'J', '<Cmd> call VSCodeCall("editor.action.moveLinesDownAction")<Cr>', options)

    map('n', '<leader>k', '<Cmd> call VSCodeNotify("editor.action.commentLine")<Cr>', options)
    map('v', '<leader>k', '<Cmd> call VSCodeCall("editor.action.commentLine")<Cr>', options)
    map('x', '<leader>l', '<Cmd> call VSCodeNotify("editor.action.selectHighlights")<Cr>', options)
end
