function enum(tbl)
    local length = #tbl
    for i = 1, length do
        local v = tbl[i]
        tbl[v] = i
    end

    return tbl
end

PythonLsp = enum {
  "pyls",
  "pyls_ms",
  "jedi_language_server",
}

return {
  -- the python language server to use
  python_lsp = PythonLsp.pyls
}
