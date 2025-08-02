{
  config,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        autocomplete = {
          nvim-cmp.enable = true;
        };

        snippets.luasnip.enable = true;

        statusline = {
          lualine = {
            enable = true;
            theme = "auto";
          };
        };

        telescope.enable = true;

        visuals = {
          nvim-web-devicons.enable = true;
        };

        languages = {
          enableFormat = true;
          lua.enable = true;
          enableTreesitter = true;
          nix.enable = true;
          markdown.enable = true;
          bash.enable = true;
          css.enable = true;
          html.enable = true;
          java.enable = true;
          ts.enable = true;
          go.enable = true;
          python.enable = true;
          rust = {
            enable = true;
            crates.enable = true;
          };
          tailwind.enable = true;
        };

        git.gitsigns.enable = true;

        extraPlugins = {
          sonokai = {
            package = pkgs.vimPlugins.sonokai;
            setup = ''
              vim.g.sonokai_style = 'default'
              vim.g.sonokai_enable_italic = 1
              vim.g.sonokai_disable_italic_comment = 0
              vim.cmd('colorscheme sonokai')
            '';
          };
        };
      };
    };
  };
}
