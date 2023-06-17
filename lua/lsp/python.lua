return {
    setup = function()
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
        local root_file = vim.fs.find(root_files, { upward = true })[1]
        local stubsPath = nil
        local root_path = ""
        if root_file then
            root_path = vim.fs.dirname(root_file)
            stubsPath = root_path .. "/stubs"
        end
        require("lspconfig").pyright.setup {
            root_dir = function()
                return root_path
            end,
            settings = {
                python = {
                    analysis = {
                        stubPath = stubsPath,
                        diagnosticMode = "openFilesOnly"
                    }
                }
            }
        }
    end
}
