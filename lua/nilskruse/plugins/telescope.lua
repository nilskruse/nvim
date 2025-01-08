return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        defaults = {
            layout_config = {
                width = 0.99,  -- Adjust the width
                height = 0.99, -- Adjust the height
            },
        },
    },
    keys = {
        { '<leader>fh',       require 'telescope.builtin'.help_tags,   desc = '[F]ind [H]elp' },
        { '<leader>fk',       require 'telescope.builtin'.keymaps,     desc = '[F]ind [K]eymaps' },
        { '<leader>ff',       require 'telescope.builtin'.find_files,  desc = '[F]ind [F]iles' },
        { '<leader>fs',       require 'telescope.builtin'.builtin,     desc = '[F]ind [S]elect Telescope' },
        { '<leader>fw',       require 'telescope.builtin'.grep_string, desc = '[F]ind current [W]ord' },
        { '<leader>fg',       require 'telescope.builtin'.live_grep,   desc = '[F]ind by [G]rep' },
        { '<leader>fd',       require 'telescope.builtin'.diagnostics, desc = '[F]ind [D]iagnostics' },
        { '<leader>fr',       require 'telescope.builtin'.resume,      desc = '[F]ind [R]esume' },
        { '<leader>f.',       require 'telescope.builtin'.oldfiles,    desc = '[F]ind Recent Files ("." for repeat,' },
        { '<leader>.',        require 'telescope.builtin'.oldfiles,    desc = '[F]ind Recent Files ("." for repeat,' },
        { '<leader><leader>', require 'telescope.builtin'.buffers,     desc = '[ ] Find existing buffers' },
        {
            '<leader>ft',
            function()
                require 'telescope.builtin'.live_grep({
                    glob_pattern = {
                        '!Makefile',
                        '!compile_commands.json',
                        '!**/CMakeFiles',
                        '!**/gui_autogen',
                        '!*.ts',
                    },
                })
            end
            ,
            desc = '[ ] Live grep with some excludes'
        },
        { '<leader>fc', require 'telescope.builtin'.git_status, desc = '[F]ind [C]hanged (git_status)' }
    },
}
