# vim-ruby-minitest

Treesitter highlighting of [Minitest](https://github.com/minitest/minitest#readme) methods, assertions, and spec DSL blocks.

## Requirements

Neovim 0.9+ with the `ruby` treesitter parser installed and treesitter highlighting enabled for Ruby buffers.
Vim 8 is no longer supported: the plugin ships a treesitter query, not a regex syntax file.

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{ "sunaku/vim-ruby-minitest", ft = "ruby" }
```

Otherwise, copy the `after/` directory into a Neovim runtime directory.

## Highlighting

Assertions and expectations (`assert_equal`, `refute_nil`, `must_equal`, ...) are captured as `@function.builtin`; spec DSL blocks (`describe`, `it`, `let`, ...) as `@function.macro`.
The stock Ruby query already highlights these as ordinary calls, so what this adds is the distinction between them.

See `:help ft-rubyminitest-syntax` for the full lists and how to restyle either group.

The `i_CTRL-X_CTRL-U` completion and the `g:ruby_minitest_fold` option were removed in the treesitter rewrite.
