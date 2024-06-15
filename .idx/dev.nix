{ pkgs, ... }: {
  channel = "stable-23.11";

  packages = [
    pkgs.inotify-tools
    pkgs.gnupg

    pkgs.nodejs_21
    pkgs.nodePackages.pnpm
    pkgs.dhall
    pkgs.dhall-json
    pkgs.dhall-lsp-server
  ];

  idx = {
    extensions = [
      # Meta
      "jnoortheen.nix-ide"
      "vscodevim.vim"

      # Project
      # "astro-build.astro-vscode"
      "Vue.volar"
      "unifiedjs.vscode-mdx"
      "dhall.dhall-lang"
      "dhall.vscode-dhall-lsp-server"
      "nvarner.typst-lsp"
    ];

    previews = {
      enable = true;
      previews = {
        web = {
          command = ["pnpm" "dev" "--port" "9000"];
          manager = "web";
        };
      };
    };

    workspace = {
      onCreate = {
        pnpm-install = "pnpm install";
        gen-dhall = "dhall-to-json --file data/main.dhall --output data/data.json --pretty";
      };
      onStart = {
        watch-dhall = ''
          inotifywait -e close_write,moved_to,create -m data |
          while read -r directory events filename; do
            dhall-to-json --file data/main.dhall --output data/data.json --pretty
          done
        '';
      };
    };
  };
}
