require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

-- Set leader
if O.leader_key == ' ' or O.leader_key == 'space' then
    vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
    vim.g.mapleader = ' '
else
    vim.api.nvim_set_keymap('n', O.leader_key, '<NOP>', {noremap = true, silent = true})
    vim.g.mapleader = O.leader_key
end

local normalOpts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local visualOpts = {
    mode = "v", -- Visual mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

vim.api.nvim_set_keymap("n", "<leader>z", ":TZAtaraxis<CR>", {noremap = true, silent = true})
-- z = {"<cmd>TZAtaraxis<cr>", "toggle zen"}

-- TODO create entire treesitter section

local normalMappings = {

    ["/"] = {"<cmd>CommentToggle<cr>", "Comment"},
    ["c"] = {"<cmd>BufferClose<cr>", "Close Buffer"},
    ["e"] = {":NvimTreeToggle<cr>", "Explorer"},
    ["f"] = {"<cmd>Telescope find_files<cr>", "Find File"},
    ["h"] = {"<cmd>set hlsearch!<cr>", "No Highlight"},
    ["z"] = {"<cmd>TZAtaraxis<cr>", "Zen"},
    b = {
      name = "+Buffers",
      j = {"<cmd>BufferPick<cr>", "jump to buffer"},
      w = {"<cmd>BufferWipeout<cr>", "wipeout buffer"},
      e = {"<cmd>BufferCloseAllButCurrent<cr>", "close all but current buffer"},
      h = {"<cmd>BufferCloseBuffersLeft<cr>", "close all buffers to the left"},
      l = {"<cmd>BufferCloseBuffersRight<cr>", "close all BufferLines to the right"},
      D = {"<cmd>BufferOrderByDirectory<cr>", "sort BufferLines automatically by directory"},
      L = {"<cmd>BufferOrderByLanguage<cr>", "sort BufferLines automatically by language"},
    },
    D = {
        name = "Debug",
        b = {"<cmd>DebugToggleBreakpoint<cr>", "Toggle Breakpoint"},
        c = {"<cmd>DebugContinue<cr>", "Continue"},
        i = {"<cmd>DebugStepInto<cr>", "Step Into"},
        o = {"<cmd>DebugStepOver<cr>", "Step Over"},
        r = {"<cmd>DebugToggleRepl<cr>", "Toggle Repl"},
        s = {"<cmd>DebugStart<cr>", "Start"}
    },
    g = {
        name = "Git",
        j = {"<cmd>NextHunk<cr>", "Next Hunk"},
        k = {"<cmd>PrevHunk<cr>", "Prev Hunk"},
        p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
        r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
        R = {"<cmd>ResetBuffer<cr>", "Reset Buffer"},
        s = {"<cmd>StageHunk<cr>", "Stage Hunk"},
        u = {"<cmd>UndoStageHunk<cr>", "Undo Stage Hunk"},
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {"<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)"}
    },
    l = {
        name = "LSP",
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>LspFormatting<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"}
    },
    s = {
        name = "Search",
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        h = {"<cmd>Telescope help_tags<cr>", "Find Help"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"}
    },
    S = {
        name = "Session",
        s = {"<cmd>SessionSave<cr>", "Save Session"},
        l = {"<cmd>SessionLoad<cr>", "Load Session"}
    },
}

local visualMappings = {
    ["/"] = {"<cmd>CommentToggle<cr>", "Comment"},
}

if O.extras then
    normalMappings["D"] = {
        name = "Diagnostics",
        t = {"<cmd>TroubleToggle<cr>", "trouble"},
        w = {"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace"},
        d = {"<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document"},
        q = {"<cmd>TroubleToggle quickfix<cr>", "quickfix"},
        l = {"<cmd>TroubleToggle loclist<cr>", "loclist"},
        r = {"<cmd>TroubleToggle lsp_references<cr>", "references"}
    }
    normalMappings["l"] = {
        name = "LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>LspFormatting<cr>", "Format"},
        h = {"<cmd>Lspsaga hover_doc<cr>", "Hover Doc"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"}
    }
    normalMappings["L"] = {
        name = "+Latex",
        c = {"<cmd>VimtexCompile<cr>", "Toggle Compilation Mode"},
        f = {"<cmd>call vimtex#fzf#run()<cr>", "Fzf Find"},
        i = {"<cmd>VimtexInfo<cr>", "Project Information"},
        s = {"<cmd>VimtexStop<cr>", "Stop Project Compilation"},
        t = {"<cmd>VimtexTocToggle<cr>", "Toggle Table Of Content"},
        v = {"<cmd>VimtexView<cr>", "View PDF"}
    }
    normalMappings["p"] = {"<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projects"}
    normalMappings["r"] = {
        name = "Replace",
        f = {"<cmd>lua require('spectre').open_file_search()<cr>", "Current File"},
        p = {"<cmd>lua require('spectre').open()<cr>", "Project"}
    }
    normalMappings["z"] = {
        name = "Zen",
        s = {"<cmd>TZBottom<cr>", "toggle status line"},
        t = {"<cmd>TZTop<cr>", "toggle tab bar"},
    }
    normalMappings[";"] = {"<cmd>Dashboard<cr>", "Dashboard"}
    visualMappings["r"] = {
        name = "Replace",
        f = {"<cmd>lua require('spectre').open_visual({path = vim.fn.expand('%')})<cr>", "File"},
        p = {"<cmd>lua require('spectre').open_visual()<cr>", "Project"}
    }
end

local wk = require("which-key")
wk.register(normalMappings, normalOpts)
wk.register(visualMappings, visualOpts)
