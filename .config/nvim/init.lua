-- Pfeiltasten im Normalmodus (n) deaktivieren
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')

-- Optional: Pfeiltasten im Einfügemodus (i) deaktivieren
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')

-- Optional: Pfeiltasten im Visuellen Modus (v) deaktivieren
vim.keymap.set('v', '<left>', '<nop>')
vim.keymap.set('v', '<right>', '<nop>')
vim.keymap.set('v', '<up>', '<nop>')
vim.keymap.set('v', '<down>', '<nop>')
-- Mit 'jk' den Einfügemodus superschnell verlassen
vim.keymap.set('i', 'jk', '<Esc>')
