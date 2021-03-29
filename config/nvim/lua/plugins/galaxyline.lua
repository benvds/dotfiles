local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section

-- gl.short_line_list = {'NvimTree'}

local function lsp_status(status)
    shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+")  do
        err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end


local function get_coc_lsp()
  local status = vim.fn['coc#status']()
  if not status or status == '' then
      return ''
  end
  return lsp_status(status)
end

function get_diagnostic_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_lsp()
    end
  return ''
end

local function get_current_func()
  local has_func, func_name = pcall(vim.fn.nvim_buf_get_var,0,'coc_current_function')
  if not has_func then return end
      return func_name
  end

function get_function_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_current_func()
    end
  return ''
end

local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return ' '
    else
        return nil
    end
end

CocStatus = get_diagnostic_info
CocFunc = get_current_func
TrailingWhiteSpace = trailing_whitespace

gls.left[2] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    icon = ' ',
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

gls.left[3] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta,colors.bg,'bold'}
  }
}

gls.left[4] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}

gls.left[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}


-- gls.left[9] = {
--     CocStatus = {
--      provider = CocStatus,
--      highlight = {colors.green,colors.bg},
--      icon = '  🗱'
--     }
-- }

-- gls.left[10] = {
--   CocFunc = {
--     provider = CocFunc,
--     icon = '  λ ',
--     highlight = {colors.yellow,colors.bg},
--   }
-- }

gls.left[11] = {
    TrailingWhiteSpace = {
     provider = TrailingWhiteSpace,
     icon = '  ',
     highlight = {colors.yellow,colors.bg},
    }
}

-- gls.left[8] = {
--   DiagnosticError = {
--     provider = 'DiagnosticError',
--     icon = ' ? ',
--     highlight = {colors.red,colors.bg}
--   }
-- }
-- gls.left[9] = {
--   DiagnosticWarn = {
--     provider = 'DiagnosticWarn',
--     icon = ' ? ',
--     highlight = {colors.yellow,colors.bg},
--   }
-- }

-- gls.left[10] = {
--   DiagnosticHint = {
--     provider = 'DiagnosticHint',
--     icon = ' ? ',
--     highlight = {colors.cyan,colors.bg},
--   }
-- }

-- gls.left[11] = {
--   DiagnosticInfo = {
--     provider = 'DiagnosticInfo',
--     icon = ' ? ',
--     highlight = {colors.blue,colors.bg},
--   }
-- }

-- gls.mid[1] = {
--   ShowLspClient = {
--     provider = 'GetLspClient',
--     condition = function ()
--       local tbl = {['dashboard'] = true,['']=true}
--       if tbl[vim.bo.filetype] then
--         return false
--       end
--       return true
--     end,
--     icon = '? LSP:',
--     highlight = {colors.cyan,colors.bg,'bold'}
--   }
-- }

-- gls.right[1] = {
--   FileEncode = {
--     provider = 'FileEncode',
--     condition = condition.hide_in_width,
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.green,colors.bg,'bold'}
--   }
-- }

-- gls.right[2] = {
--   FileFormat = {
--     provider = 'FileFormat',
--     condition = condition.hide_in_width,
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.green,colors.bg,'bold'}
--   }
-- }

-- gls.right[3] = {
--   GitIcon = {
--     provider = function() return ' ? ' end,
--     condition = condition.check_git_workspace,
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.violet,colors.bg,'bold'},
--   }
-- }

gls.right[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.bg},
  }
}
gls.right[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' ~ ',
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}

-- gls.right[8] = {
--   RainbowBlue = {
--     provider = function() return ' ?' end,
--     highlight = {colors.blue,colors.bg}
--   },
-- }

-- gls.short_line_left[1] = {
--   BufferType = {
--     provider = 'FileTypeName',
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.blue,colors.bg,'bold'}
--   }
-- }

-- gls.short_line_left[2] = {
--   SFileName = {
--     provider =  'SFileName',
--     condition = condition.buffer_not_empty,
--     highlight = {colors.fg,colors.bg,'bold'}
--   }
-- }

-- gls.short_line_right[1] = {
--   BufferIcon = {
--     provider= 'BufferIcon',
--     highlight = {colors.fg,colors.bg}
--   }
-- }
