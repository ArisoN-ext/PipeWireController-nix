# PipeWire Control Center (Nix Flake)

A minimalist Nix flake to build and run [PipeWire Control Center](https://github.com/knightinfected/PipeWireController) — a GTK4/libadwaita audio control center for PipeWire.

## Usage

Ensure you have [Nix](https://nixos.org/) installed with [flakes enabled](https://nixos.wiki/wiki/Flakes#Enable_flakes).

### Run directly

You can run the application directly without installing it:

```bash
nix run
```

### Build

To build the package locally:

```bash
nix build
```

This will create a `result` symlink in the current directory. You can then run the application using:

```bash
./result/bin/pipewire-control-center
```
