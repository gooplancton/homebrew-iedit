class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.4.6"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.6/iedit-macos-x86_64"
  MACOS_X86_SHA = "cf59d5bf7c16aa6d8ff546df99aed4cda6eb7df2dba4753072cdf9eaa2dcb6b3"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.6/iedit-macos-arm64"
  MACOS_ARM_SHA = "7b224437d4a46b38d5573b0145d225145d4d427e5545dbe2e2dba767ead3c5eb"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.6/iedit-linux"
  LINUX_SHA = "32bc699c539b4aae4d37953443d346a05b9815136b7715e7dd430df7217a7f65"

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
