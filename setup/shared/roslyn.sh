#!/usr/bin/env bash

set -e

uname_os=$(uname | tr '[:upper:]' '[:lower:]')
if [[ "$uname_os" == "darwin" ]]; then
  os_name="osx"
elif [[ "$uname_os" == "linux" ]]; then
  os_name="linux"
else
  os_name="$uname_os"
fi

arch_raw=$(uname -m)
if [[ "$arch_raw" == "x86_64" ]]; then
  arch="x64"
elif [[ "$arch_raw" == "arm64" || "$arch_raw" == "aarch64" ]]; then
  arch="arm64"
else
  arch="$arch_raw"
fi

repo="Crashdummyy/roslynLanguageServer"
latest_release_json=$(curl -s "https://api.github.com/repos/${repo}/releases/latest")
version=$(echo "$latest_release_json" | jq -r '.tag_name')

if [[ "$version" == "null" || -z "$version" ]]; then
  echo "Failed to fetch the latest version"
  exit 1
fi

base_url="https://github.com/${repo}/releases/download/${version}"
file_name="microsoft.codeanalysis.languageserver.${os_name}-${arch}.zip"
download_url="${base_url}/${file_name}"

destination="$HOME/.dotnet/roslyn"
mkdir -p "${destination}"

echo "Downloading from: ${download_url}"
curl -L -o "${file_name}" "${download_url}"
if [ $? -ne 0 ]; then
  echo "Error: Download failed"
  exit 1
fi

echo "Extracting ${file_name} into ${destination}"
unzip -o "${file_name}" -d "${destination}"
if [ $? -ne 0 ]; then
  echo "Error: Extraction failed"
  exit 1
fi

rm "${file_name}"

echo "Installation complete"
