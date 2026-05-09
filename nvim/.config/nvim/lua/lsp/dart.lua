-- Options from: https://github.com/dart-lang/sdk/blob/6d6b2ae57f6d6e592fd0d4544ca3d93b71b1f2da/pkg/analysis_server/tool/lsp_spec/README.md
vim.lsp.config("dartls", {
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    closingLabels = true,
    outline = true,
    flutterOutline = false,
    allowOpenUri = true,
  },
  settings = {
    dart = {
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/.pub-cache"),
      },
      enableSdkFormatter = false,
      completeFunctionCalls = true,
      showTodos = true,
      renameFilesWithClasses = "prompt",
      enableSnippets = true,
      updateImportsOnRename = true,
      inlayHints = true,
    },
  },
})

vim.lsp.enable("dartls")
