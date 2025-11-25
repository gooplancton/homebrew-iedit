class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.6.5"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.5/iedit-macos-x86_64"
  MACOS_X86_SHA = "a718a885f0ecd526a0b4c1eb83e27ce9fc1c4f9a892d7a000d677e11171da3ce"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.5/iedit-macos-arm64"
  MACOS_ARM_SHA = "c3905ac4a376b1023cb6f76706d2d1e8f03c9aa865ab96f294088565ba178440"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.5/iedit-linux"
  LINUX_SHA = "3bfd8076b9fad9faef94050cb7fd1e64dfa1724e4f2c98ec6ad6d831a7bd2cec"

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
