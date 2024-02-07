#!/bin/bash

# Function to detect the OS and platform
detect_os() {
  case "$(uname -s)" in
    Linux*)
      os="linux"
      case "$(uname -m)" in
        x86_64)   arch="amd64";;
        aarch64)  arch="arm64";;
        *)        arch="unknown";;
      esac
      ;;
    Darwin*)
      os="darwin"
      case "$(uname -m)" in
        x86_64)   arch="amd64";;
        arm64)   arch="arm64";;
        *)        arch="unknown";;
      esac
      ;;
    CYGWIN*)  os="windows"; arch="amd64";;
    MINGW*)   os="windows"; arch="amd64";;
    *)        os="unknown"; arch="amd64";;
  esac
}

# Function to download and install the binary
install_binary() {

  binary_url="https://github.com/cmarquezrusso/cris/releases/download/${version}/cris-${os}-${arch}"

  if [ "$version" == "latest" ]; then
    binary_url="https://github.com/cmarquezrusso/cris/releases/${version}/download/cris-${os}-${arch}"
  fi

  echo "Downloading binary from: $binary_url"
  curl -sfL "$binary_url" -o cris

  if [ $? -eq 0 ]; then
    chmod +x cris
    echo "Binary downloaded successfully."
    echo "Installation complete."
  else
    echo "Error downloading binary. Installation failed."
  fi
}

# Main script
detect_os

if [ "$os" == "unknown" ] || [ "$arch" == "unknown" ]; then
  echo "Unsupported operating system or architecture."
  echo "Cannot proceed with installation."
else
  echo "Detected OS: $os"
  echo "Detected Architecture: $arch"

  # Check if version flag is provided
  if [ -z "$version" ]; then
    echo "No version specified. Downloading the latest version."
    version="latest"
  else
    echo "Downloading version: $version"
  fi

  install_binary
fi
