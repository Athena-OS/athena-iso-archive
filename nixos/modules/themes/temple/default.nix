{ pkgs, nixpkgs, home-manager, username, theme-components, ... }:
let
  theme-components = {
    gtk-theme = "Tokyonight-Dark-B";
    icon-theme = "Tokyonight-Dark";
    cursor-theme = "oreo_blue_cursors";
    background = "temple.png";
  };
  gtkTheme = "${theme-components.gtk-theme}";
  gtkIconTheme = "${theme-components.icon-theme}";
  gtkCursorTheme = "${theme-components.cursor-theme}";
  backgroundTheme = "${theme-components.background}";
in
{
  imports =
    [
      {
        _module.args.theme-components = theme-components;
      }
    ];
  environment.systemPackages = with pkgs; [
    (callPackage ../../../pkgs/themes/athena-cyan-base/package.nix { })
  ];

  home-manager.users.${username} = { pkgs, ...}: {
    # Needed to apply the theme on GTK4 windows (like Nautilus)
    home.sessionVariables.GTK_THEME = gtkTheme;

    gtk = {
      enable = true;
      gtk3.extraConfig.gtk-decoration-layout = "menu:";
      theme = {
        name = gtkTheme;
        package = pkgs.tokyo-night-gtk;
      };
      iconTheme = {
        name = gtkIconTheme;
        #icon theme in this case is already installed by Tokyo Night GTK package
      };
      cursorTheme = {
        name = gtkCursorTheme;
        package = pkgs.oreo-cursors-plus;
      };
    };
    programs.kitty = {
      theme = "Tokyo Night Storm";
    };
    programs.vscode = {
      extensions = with pkgs.vscode-extensions; [
        enkia.tokyo-night
      ];
      # In case extensions are not loaded, refer to https://github.com/nix-community/home-manager/issues/3507
      userSettings = {
        "workbench.colorTheme" = "Tokyo Night Storm";
      };
    };
  };
}