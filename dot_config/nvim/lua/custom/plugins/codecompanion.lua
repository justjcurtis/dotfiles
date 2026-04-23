return {
    event = "VeryLazy",
    lazy = true,
    "olimorris/codecompanion.nvim",
    version = "v19.11.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
    },
    opts = {
        display = {
            chat = {
                -- Change the default icons
                icons = {
                    pinned_buffer = " ",
                    watched_buffer = "👀 ",
                },

                -- Alter the sizing of the debug window
                debug_window = {
                    ---@return number|fun(): number
                    width = vim.o.columns - 5,
                    ---@return number|fun(): number
                    height = vim.o.lines - 2,
                },

                -- Options to customize the UI of the chat buffer
                window = {
                    layout = "vertical", -- float|vertical|horizontal|buffer
                    position = "right",  -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
                    border = "single",
                    height = 0.8,
                    width = 0.45,
                    relative = "editor",
                    full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
                    opts = {
                        breakindent = true,
                        cursorcolumn = false,
                        cursorline = false,
                        foldcolumn = "0",
                        linebreak = true,
                        list = false,
                        numberwidth = 1,
                        signcolumn = "no",
                        spell = false,
                        wrap = true,
                    },
                },

                ---Customize how tokens are displayed
                ---@param tokens number
                ---@param adapter CodeCompanion.Adapter
                ---@return string
                token_count = function(tokens, adapter)
                    return " (" .. tokens .. " tokens)"
                end,
            },
        },
        adapters = {
            http = {
                ["llama.cpp"] = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        env = {
                            url = "http://127.0.0.1:8080",
                            api_key = "NOT_REQUIRED",
                            chat_url = "/v1/chat/completions",
                        },
                    })
                end,
            },
        },
        interactions = {
            chat = {
                adapter = {
                    name = "llama.cpp",
                    model = "gemma4_26b",
                },
            },
            inline = {
                adapter = {
                    name = "llama.cpp",
                    model = "gemma4_26b",
                },
            },
            cmd = {
                adapter = {
                    name = "llama.cpp",
                    model = "gemma4_26b",
                },
            },
            background = {
                adapter = {
                    name = "llama.cpp",
                    model = "gemma4_26b",
                },
            },
        },
    }
}
