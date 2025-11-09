class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.4.0"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.0/iedit-macos-x86_64"
  MACOS_X86_SHA = "1a08f7c212a9cef2e7a8489925d24a90171e8484e910da1746e26c49fb1945ee"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.0/iedit-macos-arm64"
  MACOS_ARM_SHA = "c490b8cea80fabbfaa3e31a1de3dc0696ecccb4cb180fa84a4f1be81be09f8bd"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.0/iedit-linux"
  LINUX_SHA = "36ff3817dcd81c5562f4f2748c97d9fb1d2a404aa4b633195eb5378229b5dc69"

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
