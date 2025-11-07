class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.3.2"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.2/iedit-macos-x86_64"
  MACOS_X86_SHA = "ae74bffa9ca7de4a2c147df58ddbfa93d4616896519dc39b5b7e4db312bf6100"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.2/iedit-macos-arm64"
  MACOS_ARM_SHA = "9882e88e95027838d5fa5e4d34c53f7f666aba6a9030b264e9ac31efdce159cd"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.2/iedit-linux"
  LINUX_SHA = "d05e1a094918b70389c4db4c1a0e0af545b59856cd60e0910bb115acfd37828b"

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
