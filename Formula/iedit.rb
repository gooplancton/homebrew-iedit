class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.4.2"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.2/iedit-macos-x86_64"
  MACOS_X86_SHA = "443d826a49c25ed0bdcd947c722fc4c0c1c170bb656e9c85207d8d79cfc2fe63"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.2/iedit-macos-arm64"
  MACOS_ARM_SHA = "0e5a0770c02eef3cb54e99db3a2ca2c815464a827c46ad170014caed1221450a"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.2/iedit-linux"
  LINUX_SHA = "3fc5c75c2a0e8d0c9e7e1072ecb8666b2246e4f65bbe04306e427a2b44b09360"

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
