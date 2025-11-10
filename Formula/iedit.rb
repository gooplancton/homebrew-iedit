class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.4.4"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.4/iedit-macos-x86_64"
  MACOS_X86_SHA = "ca9ebb297a5a45daf1184021b8c366257bc3cf0b3cc2f7ca421f41b50236a6a8"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.4/iedit-macos-arm64"
  MACOS_ARM_SHA = "b52e358b1a4a654e63e14dc51f0d1de25c3c717e242c2dda9feccf1f976ea6ca"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.4/iedit-linux"
  LINUX_SHA = "9d2cef66bebd5a5568469d4184dfc2c5ea04e6c60a5a047bb8ac4ad0c41f6c89"

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
