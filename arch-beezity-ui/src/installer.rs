use anyhow::Result;
use std::process::Command;
use indicatif::{ProgressBar, ProgressStyle};

pub struct Installer {
    user: String,
    is_cachyos: bool,
}

impl Installer {
    pub fn new(is_cachyos: bool) -> Result<Self> {
        let user = std::env::var("USER")?;
        Ok(Self { user, is_cachyos })
    }

    pub fn install_git(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing git...");
        
        Command::new("sudo")
            .args(["pacman", "-S", "--noconfirm", "git"])
            .output()?;
            
        pb.finish_with_message("Git installed!");
        Ok(())
    }

    pub fn install_yay(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing yay...");
        
        Command::new("git")
            .args(["clone", "https://aur.archlinux.org/yay.git"])
            .output()?;
            
        Command::new("sh")
            .args(["-c", "cd yay && makepkg -si --noconfirm"])
            .output()?;
            
        Command::new("rm")
            .args(["-rf", "yay"])
            .output()?;
            
        pb.finish_with_message("Yay installed!");
        Ok(())
    }

    pub fn install_fonts(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing fonts...");
        
        Command::new("sudo")
            .args(["pacman", "-S", "--noconfirm", "noto-fonts", "noto-fonts-cjk", "noto-fonts-emoji"])
            .output()?;
            
        pb.finish_with_message("Fonts installed!");
        Ok(())
    }

    pub fn install_gaming_packages(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing gaming packages...");
        
        if self.is_cachyos {
            Command::new("yay")
                .args(["-S", "--noconfirm", "cachyos-gaming-meta", "cachyos-gaming-applications"])
                .output()?;
        } else {
            Command::new("yay")
                .args(["-S", "--noconfirm", "arch-gaming-meta"])
                .output()?;
        }
            
        pb.finish_with_message("Gaming packages installed!");
        Ok(())
    }

    pub fn install_aur_packages(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing AUR packages...");
        
        let packages = [
            "dxvk-gplasync-bin-git",
            "reflector",
            "ttf-ms-win11-auto",
            "zen-browser-bin",
            "vesktop-bin",
            "yaru-gtk-theme",
            "virt-manager",
            "qemu-full",
            "visual-studio-code-bin",
            "virtualbox",
            "virtualbox-dkms",
            "virtualbox-guest-iso",
            "virtualbox-ext-vnc",
            "neovim",
            "ghostty",
            "kitty",
            "thunar",
            "virt-viewer",
            "dnsmasq",
            "vde2",
            "bridge-utils",
            "openbsd-netcat",
            "ebtables",
            "iptables",
            "libguestfs",
        ];

        for package in packages.iter() {
            Command::new("yay")
                .args(["-S", "--noconfirm", package])
                .output()?;
        }
            
        pb.finish_with_message("AUR packages installed!");
        Ok(())
    }

    pub fn install_hyde(&self) -> Result<()> {
        let pb = ProgressBar::new(1);
        pb.set_style(ProgressStyle::default_spinner());
        pb.set_message("Installing HyDE...");
        
        Command::new("sudo")
            .args(["pacman", "-S", "--needed", "--noconfirm", "git", "base-devel"])
            .output()?;
            
        Command::new("git")
            .args(["clone", "--depth", "1", "https://github.com/HyDE-Project/HyDE", "~/HyDE"])
            .output()?;
            
        Command::new("sh")
            .args(["-c", "cd ~/HyDE/Scripts && ./install.sh"])
            .output()?;
            
        pb.finish_with_message("HyDE installed!");
        Ok(())
    }
} 