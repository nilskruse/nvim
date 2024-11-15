return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                completion = { completeopt = 'menu,menuone,noinsert' },
                formatting = lsp_zero.cmp_format({ details = true }),
                mapping = cmp.mapping.preset.insert({
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),

                    ['<C-Space>'] = cmp.mapping.complete(),

                    -- ['<C-n>'] = cmp.mapping.select_next_item(),
                    -- ['<C-p>'] = cmp.mapping.select_prev_item(),
                    -- ['<C-y>'] = cmp.mapping.confirm { select = true },

                    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    -- ['<Tab>'] = cmp_action.luasnip_supertab(),
                    -- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                }),
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'buffer',  keyword_length = 4 },
                    { name = 'luasnip', keyword_length = 2 },
                },
                preselect = 'item',
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            --- if you want to know more about lsp-zero and mason.nvim
            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
                end

                map('<C-k>', vim.diagnostic.goto_prev, "Previous diagnostic")
                map('<C-l>', vim.diagnostic.goto_next, "Next diagnostic")
                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
                map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                map('<leader>lic', require('telescope.builtin').lsp_incoming_calls, '[L]ist [I]ncoming [C]alls')
                map('<leader>loc', require('telescope.builtin').lsp_outgoing_calls, '[L]ist [O]utgoing [C]alls')
                map('<leader>ld', require('telescope.builtin').diagnostics, '[L]ist [D]iagnostics')

                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                map('K', vim.lsp.buf.hover, 'Hover Documentation')
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map('<F3>', '<cmd>lua vim.lsp.buf.format({async = false})<cr>', 'Format')

                map('<F4>', ':ClangdSwitchSourceHeader<cr>', 'Switch to header')
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                    rust_analyzer = function()
                        require 'lspconfig'.rust_analyzer.setup {
                            settings = {
                                ['rust-analyzer'] = {
                                    cfg = {
                                        setTest = false,
                                    },
                                }
                            },
                            on_attach = function(client, bufnr)
                                local map = function(keys, func, desc)
                                    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
                                end
                                local change = function()
                                    globalSetTest = not globalSetTest
                                    local newSetTest =
                                        not require "lspconfig".rust_analyzer.manager.config.settings["rust-analyzer"]
                                        .cfg.setTest
                                    print('rust-analyzer.cfg.setTest =', newSetTest)
                                    require 'lspconfig'.rust_analyzer.setup {
                                        settings = {
                                            ['rust-analyzer'] = {
                                                cfg = {
                                                    setTest = newSetTest,
                                                },
                                            }
                                        } }
                                end

                                map('<F8>', change, 'Set Test')
                            end
                        }
                    end,
                }
            })
        end
    }
}
