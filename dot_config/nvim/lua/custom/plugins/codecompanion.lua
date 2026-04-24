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
                llama = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        env = {
                            url = "http://127.0.0.1:8080",
                            api_key = "NOT_REQUIRED",
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
                                default = "gemma4_26b",
                                choices = {
                                    ["qwopus_35_r"] = { opts = { can_reason = true } },
                                    ["gemma4_26b_r"] = { opts = { can_reason = true } },
                                    ["qwen_36_27b_r"] = { opts = { can_reason = true } },
                                    ["qwopus_35"] = { opts = { can_reason = false } },
                                    ["gemma4_26b"] = { opts = { can_reason = false } },
                                    ["qwen_36_27b"] = { opts = { can_reason = false } },
                                },
                            },
                        }
                    })
                end,
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
                adapter = "llama",
            },
            inline = {
                adapter = "llama",
            },
            cmd = {
                adapter = "llama",
            },
            background = {
                adapter = "llama",
            },
        },
    }
}
