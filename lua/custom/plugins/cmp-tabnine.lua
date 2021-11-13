local ok, tabnine = pcall(require, "cmp_tabnine.config")

if not ok then
   return
end

local M = {}
M.setup = function()
   tabnine:setup {
      max_lines = 1000,
      max_num_results = 20,
      sort = true,
      run_on_every_keystroke = true,
      snippet_placeholder = "..",
   }

end
return M

