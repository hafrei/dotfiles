{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "hafrei";
    homeDirectory = "/home/hafrei";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      FZF_DEFAULT_COMMAND = "fd --type f";
      TERM = "xterm-256color";
    };

# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
    stateVersion = "23.05"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
      packages = with pkgs; [
        zsh-prezto
        ripgrep
        fd
        bat
        lsd
        tmux
        xxd
        patchelf
        gdb
        openocd
        fzf
        lsd
        gnumake
        glibc.dev
        file
#libusb
#binutils
#usbutils
#ctags
#gnumake

# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
#  '')
        ];

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
    file = {
      ".config/lsd/lsd.yaml".source = ~/dotfiles/lsd.yaml;
      ".zshrc".source = ~/dotfiles/zshrc;
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
    };

# You can also manage environment variables but you will have to manually
# source
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/hafrei/etc/profile.d/hm-session-vars.sh
#
  };
# Let Home Manager install and manage itself.
  programs = {
    zsh.enable = true;
    home-manager.enable = true;
    neovim = {
      viAlias = true;
      vimAlias = true;
      package = pkgs.neovim-nightly;
    };
    git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "hafrei";
      userEmail = "h.a.freiburger@gmail.com";
      extraConfig = {
        core.editor = "$EDITOR";
        pull.rebase = true;
        core.pager = "${pkgs.delta}/bin/delta";
        interactive.diffFilter= "${pkgs.delta}/bin/delta --color-only";
        add.interactive.useBuiltin = false;
        delta = {
          features = "chameleon";
          navigate = true;
          light = false;
        };
        init = {
          defaultBranch = "main";
        };
      };
    };

  };
  xdg.configFile = {
    "nvim/init.vim".source = ~/dotfiles/nvim/init.vim;
  };
}
