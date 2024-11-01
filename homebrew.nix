{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # cleanup = "zap";
    };

    taps = [ ];
    masApps = { };

    brews = [
      "act"
      "agg"
      "asciinema"
      "bitwarden-cli"
      "ccache"
      "cmake"
      "dfu-programmer"
      "docker"
      "docker-compose"
      "ffmpeg"
      "ffmpeg@6"
      "gh"
      "gifsicle"
      "glow"
      "gpx"
      "helm"
      "jq"
      "kind"
      "kubernetes-cli"
      "lima"
      "make"
      "neofetch"
      "nvm"
      "pyenv"
      "pyenv-virtualenv"
      "qemu"
      "rclone"
      "rsync"
      "rustup-init"
      "socket_vmnet"
      "tig"
      "tmux"
      "usbutils"
      "wget"
      "winetricks"
      "xcbeautify"
      "ykman"
      "ykpers"
      "yubico-piv-tool"
    ];

    casks = [
      "alacritty"
      "alt-tab"
      "amethyst"
      "android-platform-tools"
      "arduino-ide"
      "bruno"
      "discord"
      "dotnet-sdk"
      "droidcam-obs"
      "elgato-stream-deck"
      "firefox"
      "focusrite-control"
      "freecad"
      "rancher"
      "gimp"
      "google-chrome"
      "inkscape"
      "jetbrains-toolbox"
      "jordanbaird-ice"
      "kdenlive"
      "keymapp"
      "kube-forwarder"
      "kubenav"
      "logitech-g-hub"
      "logitune"
      "microsoft-auto-update"
      "microsoft-remote-desktop"
      "microsoft-teams"
      "midi-monitor"
      "obs"
      "obs-backgroundremoval"
      "powershell"
      "raspberry-pi-imager"
      "raycast"
      "reaper"
      "rectangle"
      "resolutionator"
      "rode-central"
      "sdformatter"
      "soduto"
      "spotify"
      "steam"
      "teensy"
      "tiny-player"
      "touchosc"
      "touchosc-bridge"
      "touchosc-editor"
      "visual-studio-code"
      "vlc"
      "wine-stable"
      "wireshark"
      "yubico-authenticator"
      "yubico-yubikey-manager"
      "zoom"
    ];
  };
}
