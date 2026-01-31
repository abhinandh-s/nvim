return {
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "alejandra" },     -- or nixfmt or nixpkgs-fmt
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake "/home/abhi/projects/github/nixdots").nixosConfigurations.nixos.options',
        },
        home_manager = {
          expr = '(builtins.getFlake "/home/abhi/projects/github/nixdots").homeConfigurations.nixos.options',
        },
      },
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
}
