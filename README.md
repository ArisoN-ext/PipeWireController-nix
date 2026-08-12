# PipeWire Control Center (Nix Flake)

A minimalist Nix flake to build and run [PipeWire Control Center](https://github.com/knightinfected/PipeWireController) — a GTK4/libadwaita audio control center for PipeWire.

## Usage

Ensure you have [Nix](https://nixos.org/) installed with [flakes enabled](https://nixos.wiki/wiki/Flakes#Enable_flakes).

### Run directly

You can run the application directly without installing it:

```bash
nix run github:ArisoN-ext/PipeWireController-nix
```

### Build

To build the package locally:

```bash
git clone https://github.com/ArisoN-ext/PipeWireController-nix
```

```bash
cd PipeWireController-nix
```

```bash
nix build
```

This will create a `result` symlink in the current directory. You can then run the application using:

```bash
./result/bin/pipewire-control-center
```

## Binary Cache

To avoid building from source, you can use the pre-built binaries from [Cachix](https://app.cachix.org/cache/pipewirecontroller-nix).

Add the following to your `nix.conf` (usually located at `~/.config/nix/nix.conf` or `/etc/nix/nix.conf`):
```text
substituters = https://cache.nixos.org https://pipewirecontroller-nix.cachix.org
trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= pipewirecontroller-nix.cachix.org-1:wY/tr9Hxc0kvGW2zgh2DUjQI+LqLBCQ7bm9Wkr3dgdc=
```

For **NixOS**, add this to your `configuration.nix`:
```nix
nix.settings = {
  substituters = [ "https://pipewirecontroller-nix.cachix.org" ];
  trusted-public-keys = [ "pipewirecontroller-nix.cachix.org-1:wY/tr9Hxc0kvGW2zgh2DUjQI+LqLBCQ7bm9Wkr3dgdc=" ];
};
```
