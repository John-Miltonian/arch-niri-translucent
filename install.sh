#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════════
#   INSTALLATION SCRIPT
#   Arch Linux Rice - Niri + Dark Mode + Transparent Windows
#   Christian Aesthetic
# ═══════════════════════════════════════════════════════════════════════════════

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
GOLD='\033[38;5;178m'
PURPLE='\033[38;5;54m'
PARCHMENT='\033[38;5;180m'
NC='\033[0m'

# Banner
echo -e "${PURPLE}"
echo "  ╔═══════════════════════════════════════════════════════════════╗"
echo "  ║           ✝  ARCH NIRI - Dark Mode + Transparency            ║"
echo "  ║              Christian Themed Linux Desktop                  ║"
echo "  ╚═══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check if running on Arch Linux
if [[ ! -f /etc/arch-release ]]; then
    echo -e "${RED}Error: This rice is designed for Arch Linux${NC}"
    exit 1
fi

# Check for yay (AUR helper)
if ! command -v yay &> /dev/null; then
    echo -e "${GOLD}Installing yay (AUR helper)...${NC}"
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
fi

echo -e "${GOLD}Updating system...${NC}"
sudo pacman -Syu --noconfirm

# Core packages
echo -e "${GOLD}Installing core packages...${NC}"
sudo pacman -S --needed --noconfirm \
    niri \
    kitty \
    waybar \
    fuzzel \
    mako \
    swaylock \
    cliphist \
    wl-clipboard \
    swww \
    fastfetch \
    brightnessctl \
    pamixer \
    pavucontrol \
    thunar \
    ttf-jetbrains-mono-nerd \
    ttf-font-awesome \
    papirus-icon-theme \
    firefox \
    jq

# Install optional AUR packages
echo -e "${GOLD}Installing AUR packages...${NC}"
yay -S --needed --noconfirm wlogout || echo "wlogout installation skipped (optional)"

# Create directories
echo -e "${GOLD}Creating directories...${NC}"
mkdir -p ~/.config/{niri,kitty,waybar,fuzzel,mako,swaylock,fastfetch,wlogout,swww}
mkdir -p ~/.config/waybar/modules
mkdir -p ~/.local/bin
mkdir -p ~/.config/wallpapers
mkdir -p ~/Pictures/Screenshots

# Copy configuration files
echo -e "${GOLD}Installing configuration files...${NC}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp -r "$SCRIPT_DIR/config/niri/"* ~/.config/niri/
cp -r "$SCRIPT_DIR/config/kitty/"* ~/.config/kitty/
cp -r "$SCRIPT_DIR/config/waybar/"* ~/.config/waybar/
cp -r "$SCRIPT_DIR/config/fuzzel/"* ~/.config/fuzzel/
cp -r "$SCRIPT_DIR/config/mako/"* ~/.config/mako/
cp -r "$SCRIPT_DIR/config/swaylock/"* ~/.config/swaylock/
cp -r "$SCRIPT_DIR/config/fastfetch/"* ~/.config/fastfetch/

# Copy scripts
echo -e "${GOLD}Installing scripts...${NC}"
cp -r "$SCRIPT_DIR/scripts/"* ~/.local/bin/
chmod +x ~/.local/bin/*.sh
chmod +x ~/.config/waybar/modules/*.sh

# Create a simple placeholder wallpaper
echo -e "${GOLD}Creating placeholder wallpaper...${NC}"
if command -v ffmpeg &> /dev/null; then
    ffmpeg -f lavfi -i "color=c=0x0a0a0a:s=1920x1080" -frames:v 1 ~/.config/wallpapers/cross-dark.png 2>/dev/null || touch ~/.config/wallpapers/cross-dark.png
elif command -v convert &> /dev/null; then
    convert -size 1920x1080 xc:"#0a0a0a" ~/.config/wallpapers/cross-dark.png 2>/dev/null || touch ~/.config/wallpapers/cross-dark.png
else
    touch ~/.config/wallpapers/cross-dark.png
fi

# Add local bin to PATH if not present
if ! grep -q ".local/bin" ~/.bashrc 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

# Enable services
echo -e "${GOLD}Enabling services...${NC}"
sudo systemctl enable --now bluetooth.service 2>/dev/null || true

# Print completion message
echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                   ✝  Installation Complete  ✝                ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${PARCHMENT}Keybindings:${NC}"
echo "  Mod+Enter     - Open terminal (kitty)"
echo "  Mod+D         - Open launcher (fuzzel)"
echo "  Mod+B         - Open browser (firefox)"
echo "  Mod+Q         - Close window"
echo "  Mod+Tab       - Overview mode"
echo "  Mod+Shift+L   - Lock screen"
echo "  Mod+1-9       - Switch workspace"
echo ""
echo -e "${PARCHMENT}Next steps:${NC}"
echo "  1. Log out and select 'Niri' from your display manager"
echo "  2. Or run 'niri' from a TTY to start the session"
echo "  3. Replace ~/.config/wallpapers/cross-dark.png with your preferred wallpaper"
echo ""
echo -e "${GOLD}May your desktop be blessed. ✝${NC}"
