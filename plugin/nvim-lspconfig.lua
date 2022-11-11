local configs = require 'lspconfig.configs'
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

local capabilities = vim.lsp.protocol.make_client_capabilities()

local scriptDir = debug.getinfo(1).source:match("@?(.*/)")

configs.phpactor = {
  default_config = {
    autostart = true,
    cmd_env = {
      XDG_CACHE_HOME = '/tmp'
    },
    cmd = {
      vim.loop.fs_realpath(scriptDir .. '/../pack/lsp/opt/phpactor/bin/phpactor'),
      'language-server',
    },
    filetypes = { 'php' },
    root_dir = function(pattern)
      local cwd = vim.loop.cwd()
      local root = util.root_pattern('composer.json', '.git')(pattern)

      return util.path.is_descendant(cwd, root) and cwd or root
    end,
    init_options = {
      ['logging.path'] = '/tmp/phpactor.log',
      ['completion_worse.completor.keyword.enabled'] = true,
    },
  },
}

lspconfig.phpactor.setup {
  capabilities = capabilities,
  -- on_attach = arctgxLsp.onAttach,
}
