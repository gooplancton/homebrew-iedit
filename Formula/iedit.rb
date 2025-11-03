class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.2.1"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.2.1/iedit-macos-x86_64"
  MACOS_X86_SHA = "1827b41e33cbdb02acf2e8e2723a6afa09a213f654a3509f4e0d101425e7d0f2"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.2.1/iedit-macos-arm64"
  MACOS_ARM_SHA = "8361326963aaaf5b0b90f39fe760d0d3703de4b170224736f060d21050489bfd"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.2.1/iedit-linux"
  LINUX_SHA = "2332c50341ba2286c7175b97206bb0f917b220319e4784ced4840410b8a9a293"

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
