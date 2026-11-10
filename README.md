# Aperture

1. [Introduction](#Introduction)
2. [Installation](#Installation)
3. [Troubleshoot](#Troubleshoot)
4. [Contribution](#Contribution)

## Introduction
## Installation

### Step 1: Clone repository

```bash

mkdir -p ~/.config/quickshell
git clone https://github.com/doomsdaycome/aperture.git ~/.config/quickshell/background

```

### Step 2: Start quickshell

- Manual start

```bash

quickshell -c background

```

- Auto startup

Hyprland:

```lua

hl.on("hyprland.start", function()
  hl.exec_cmd("quickshell -c background")
end)

```

### Step 3: Configuration

> [!IMPORTANT]
> A dedicated GUI app for aperture is under development. We appreciate your patience.




## Troubleshoot
## Contribution
