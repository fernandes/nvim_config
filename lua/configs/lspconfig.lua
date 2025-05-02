require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
vim.lsp.enable(servers)

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require "lspconfig"

local my_on_attach = function(client, bufnr)
  -- if lsp supports formatting, format it !
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds {
      group = augroup,
      buffer = bufnr,
    }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
        vim.lsp.buf.format {
          async = false,
          timeout_ms = 2000,
        }
      end,
    })
  end

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings.
  local opts = {
    noremap = true,
    silent = true,
  }
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("i", "<C><space>", "<cmd>lua vim.lsp.buf.completion()<CR>", opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap("n", "<space>rm", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>rr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "<space>i", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  buf_set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.format({async = false})<CR>", opts)
end

lspconfig.ruby_lsp.setup {
  capabilities = capabilities,
  on_attach = my_on_attach,
}

lspconfig.markdown_oxide.setup {
  capabilities = vim.tbl_deep_extend("force", capabilities, {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  }),
  ---@diagnostic disable-next-line:unused-local
  on_attach = function(client, bufnr)
    -- refresh codelens on TextChanged and InsertLeave as well
    vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", "CursorHold", "LspAttach" }, {
      buffer = bufnr,
      callback = vim.lsp.codelens.refresh,
    })

    -- trigger codelens refresh
    vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })

    -- setup conceallevel to enable it in obsidian.nvim
    vim.opt.conceallevel = 2

    -- sometimes it doesn't work twice on same buffer
    -- open a new buffer and run Daily again
    vim.api.nvim_create_user_command("Daily", function(args)
      local input = { "today" }
      if args.args ~= "" then
        input = { args.args or "today" }
      end

      vim.lsp.buf_request(bufnr, "workspace/executeCommand", {
        command = "jump",
        arguments = input,
      }, function(err, result)
        if result then
          vim.print(result)
        end
        if err then
          vim.print(err)
          vim.notify("Jump failed: " .. err.message, vim.log.levels.ERROR)
        end
      end)
    end, { desc = "Open daily note", nargs = "*" })
  end,
}

-- lspconfig.marksman.setup {
--   -- capabilities = capabilities,
--   -- on_attach = my_on_attach
--   capabilities = vim.tbl_deep_extend("force", capabilities, {
--     textDocument = {
--       formatting = {
--         dynamicRegistration = true,
--       },
--     },
--   }),
--   on_attach = function(client, bufnr)
--     client.server_capabilities.documentFormattingProvider = true
--     -- Enable formatting
--     vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { buffer = bufnr, desc = "Format Markdown" })
--     vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Markdown" })
--     vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action Markdown" })
--   end,
-- }
