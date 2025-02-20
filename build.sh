#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf install -y tmux hyprland 
#other hyprland addons i didnt knew if i needed or not so left them here
#aquamarine hyprlang hyprcursor hyprutils hyprgraphics

#trying to install vscodium and waveterm
wget -O codium.rpm -P / https://github.com/VSCodium/vscodium/releases/download/1.97.2.25045/codium-1.97.2.25045-el9.x86_64.rpm 
wget -O wave.rpm -P / https://dl.waveterm.dev/releases-w2/waveterm-linux-x86_64-0.11.0.rpm /wave.rpm

dnf install /codium.rpm /wave.rpm -y

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
