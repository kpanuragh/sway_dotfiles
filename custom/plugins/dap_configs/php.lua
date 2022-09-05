local dap = require('dap')
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '/home/anuraghkp/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js' }
  } 
