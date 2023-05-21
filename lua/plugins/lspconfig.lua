return {
    "neovim/nvim-lspconfig",
    config = function()
        --python
        local root_files = {
            'pyproject.toml',
            'setup.py',
            'main.py',
            'setup.cfg',
            'requirements.txt',
            'Pipfile',
            'pyrightconfig.json',
        }
        --遇到没有存根的库,pyright速度会变慢,所以需要指定存根路径 
        local root_file= vim.fs.find(root_files, { upward = true })[1]
        local stubsPath = nil
        if root_file then
            stubsPath= vim.fs.dirname(root_file).."/stubs"
        end
        require("lspconfig").pyright.setup{
            settings={
                python={
                    analysis={
                        stubPath=stubsPath
                    }
                }
            }
        }

        --lua
        --require("lspconfig").lua_ls.setup {
            --settings = {
                --Lua = {
                    --runtime = {
                        ---- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        --version = 'LuaJIT',
                    --},
                    --diagnostics = {
                        ---- Get the language server to recognize the `vim` global
                        --globals = { 'vim' },
                    --},
                    --workspace = {
                        ---- Make the server aware of Neovim runtime files
                        --library = vim.api.nvim_get_runtime_file("", true),
                    --},
                    ---- Do not send telemetry data containing a randomized but unique identifier
                    --telemetry = {
                        --enable = false,
                    --},
                --},
            --},
        --}
    end
}
