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
                lmstudio = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        env = {
                            url = "https://justjcurtis.a.pinggy.link",
                            api_key = "LMSTUDIO_API_KEY",
                            chat_url = "/v1/chat/completions",
                        },
                        opts = {
                            show_model_choices = true,
                        },
                        schema = {
                            model = {
                                order = 1,
                                mapping = "parameters",
                                type = "enum",
                                desc =
                                "ID of the model to use. See the model endpoint compatibility table for details on which models work with the Chat API.",
                                ---@type string|fun(): string
                                default = "qwopus3.5-27b-v3.5",
                                choices = {
                                    ["google/gemma-4-26b-a4b"] = { opts = { can_reason = true } },
                                    ["qwopus3.5-27b-v3.5"] = { opts = { can_reason = true } },
                                },
                            },
                        }

                    })
                end,
            },
        },
        interactions = {
            chat = {
                adapter = "lmstudio",
            },
            inline = {
                adapter = "lmstudio",
            },
            cmd = {
                adapter = "lmstudio",
            },
            background = {
                adapter = "lmstudio",
            },
        },
    }
}
