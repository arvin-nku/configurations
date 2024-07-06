-- 'return' -> returns the value of something [function...]
-- is common for plugins to be able to access modules as tables.
return {
  "nvim-treesitter/nvim-treesitter",
  -- command to run after the plugin is installed to update Tree-sitter parsers.
  -- [A 'parser' is a software component that processes input data (such as source
  -- code) and builds a data structure, often in the form of a parse tree or abstract
  -- syntax tree (AST). The parser interprets the structure and meaning of the input
  -- data according to the rules of a formal grammar.
	-- Purpose of a Parser:
	-- -> Syntax Analysis: A parser checks the input data to ensure it follows
	--    the grammatical rules of the language (e.g., programming language syntax).
	-- -> Structural Building: It builds a hierarchical structure (parse tree or AST)
	--    that represents the input data's syntax.
	-- -> Preparation for Further Processing: the resulting structure is used by
	--    other components of a compiler, interpreter, or tool for tasks like semantic
	--    analysis, code generaton, or syntax highlighting.
  run = ":TSUpdate",
  -- here: anonymous function
  -- [why?] -> using a function to set up the configuration allows for greater flexibility
  --        -> and modularity. In this context of Neovim plugin configurations, defining
  --        -> the setup within a function ensures that the configuration is executed only
  -- 	    -> when the plugin is loaded, providing a way to lazily load the configuration.
  -- [Encapsulation] -> Encapsulating the configuration logic within a function helps
  --                 -> in keeping the global namespace clean.
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { -- Automatically install maintained parsers
        "python",
        "cpp",
        "c",
        "lua", 
        "html",
        "css",
      },
      highlight = {
        enable = true,                -- Enable highlighting using Tree-sitter
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,                -- Enable indentation based on Tree-sitter
      },
      autotag = {
        enable = true, -- autoclose tags for HTML for example
      },
      event = {
        "BufReadPre",
        "BufNewFile",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            },
          },
        },
      }
      
      vim.opt.foldmethod = 'manual'
      vim.opt.foldcolumn = '1' -- show fold column with width of 1
      vim.opt.foldenable = true -- enable folding by default
  end
}

-- KEYMAPS:
-- [SELECTION]
-- 'gnn' [init_selection]: "Initializes the selection -> This starts the selection process
-- 			    at the current curser position."
-- 'grn' [node_incremental]: "Expands the selection to the next node -> Each press of the key
-- 			      will incrementally select a larger synntactic unit."
-- 'grc' [scope_incremental]: "Expands the selection to the next scope -> Scopes are larger
-- 			       units that can include functions or other block structures."
-- 'grm' [node_decremental]: "Contracts the selection to the previous node."
--[TEXT-OBJECTS] -> used with operator commands like 'daf' (deletes the entire function)
-- 'af': Select around the outer part of a function.
-- 'if': Select the inner part of a function.
-- 'ac': Select around the outer part of a class.
-- 'ic': Select the inner part of a class.
