{ config, pkgs, lib, username, homeDirectory, ... }:

{
  home = {
    inherit username;
    homeDirectory = lib.mkForce homeDirectory;
    stateVersion = "24.05";

    shellAliases = {
      man = "batman";
    };

    packages = [
      pkgs.thefuck
      pkgs.fd
      pkgs.delta # TODO: Move to git config
    ];

    file = { };

    sessionVariables = {
      EDITOR = "nvim";
      HOMEBREW_CASK_OPTS = "--no-quarantine";
    };
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = false;
      syntaxHighlighting.enable = true;

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      profileExtra = ''
        zstyle ':completion:*' rehash true
        eval "$(/opt/homebrew/bin/brew shellenv)"
        export PATH="/Users/ellie/.rd/bin:$PATH:/Users/ellie/.local/bin:/Users/ellie/Library/Application Support/JetBrains/Toolbox/scripts"
      '';

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "poetry"
          "brew"
          #  "fzf"
          #  "zoxide"
        ];
        theme = "agnoster";
      };
    };

    bat = {
      enable = true;
      config = {
        theme = "Nord";
      };
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batpipe batwatch ];
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    ripgrep = {
      enable = true;
    };

    # git = {
    #   enable = true;
    #   userEmail = "ellie@eltariel.com";
    #   userName = "Ellie T";
    #   delta = {
    #     enable = true;
    #     # options = "";
    #   };
    # };

    eza = {
      enable = true;
      git = true;
      icons = "auto";
      # extraConfig = [""];
    };

    jq.enable = true;

    neovim = {
      enable = true;
      vimAlias = true;
      vimdiffAlias = true;
    };

    fzf.enable = true;

    pyenv = {
      enable = true;
      rootDirectory = "${homeDirectory}/.pyenv";
    };

    zoxide.enable = true;
    thefuck.enable = true;

    tmux = {
      enable = true;
      # TODO: config
    };

    home-manager.enable = true;
  };

  # manual = {
  #   html.enable = true;
  #   json.enable = true;
  #   manpages.enable = true;
  # };
}
