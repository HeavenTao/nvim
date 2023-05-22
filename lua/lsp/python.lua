return {
    setup=function()
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
                        stubPath=stubsPath,
                        diagnosticMode="openFilesOnly"
                    }
                }
            }
        }
    end
}
