class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.2.0"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.2.0/iedit-macos-x86_64"
  MACOS_X86_SHA = "48a70af59fc27a56f97b0c088a836f155a372aec8477f59640b0d17d4dc202ef"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.2.0/iedit-macos-arm64"
  MACOS_ARM_SHA = "77d40ab035a13e8b289749ad904bc37afe46fb2fb2e06f36f1967651d8c149f5"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.2.0/iedit-linux"
  LINUX_SHA = "f3f92f45e3ba15b6c0bd536c43d82c54ee246360e19a8c983cf0e2e876d44f51"

  on_macos do
    if Hardware::CPU.intel?
      url MACOS_X86_URL
      sha256 MACOS_X86_SHA
    else
      url MACOS_ARM_URL
      sha256 MACOS_ARM_SHA
    end
  end

  on_linux do
    url LINUX_URL
    sha256 LINUX_SHA
  end
  
  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "iedit-macos-x86_64" => "iedit"
      else
        bin.install "iedit-macos-arm64" => "iedit"
      end
    else
      bin.install "iedit-linux" => "iedit"
    end
  end
  
  test do
    output = shell_output("#{bin}/iedit --version 2>&1", 0)
    assert_match version.to_s, output
  end
end
