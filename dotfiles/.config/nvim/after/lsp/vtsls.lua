local vue_language_server_path = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local config = {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {},
      },
    },
  },
}

-- Solo integrarlo si el plugin de Vue existe en Mason
if vim.fn.isdirectory(vue_language_server_path) == 1 then
  table.insert(config.settings.vtsls.tsserver.globalPlugins, {
    name = "@vue/typescript-plugin",
    location = vue_language_server_path,
    languages = { "vue" },
    configNamespace = "typescript",
    enableForWorkspaceTypeScriptVersions = true,
  })
  table.insert(config.filetypes, "vue")
end

return config
