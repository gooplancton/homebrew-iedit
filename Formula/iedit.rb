class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.2.2"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.2.2/iedit-macos-x86_64"
  MACOS_X86_SHA = "c6781ee23bef3ebbc04faf26553bfc5fd0a6f8f9c633aaffb4bf4269a766d6d0"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.2.2/iedit-macos-arm64"
  MACOS_ARM_SHA = "27c0823f0e9aaf5a9711047e58eb8b9a3b8f42281274731fb693631d99933bc7"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.2.2/iedit-linux"
  LINUX_SHA = "958ee8da77e53963ca9a825f91bff76a78bec8e344f61d97dc6571d0db99a273"

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
