class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.3.0"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.0/iedit-macos-x86_64"
  MACOS_X86_SHA = "da6c6ddf528f6eca13e0bc94cce800377ccb4ca2644ef9f306323642924abb72"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.0/iedit-macos-arm64"
  MACOS_ARM_SHA = "d2855acbf707de14add2a1f70d2b7a6f07a8de22811665095c3d0e179a03d3d9"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.0/iedit-linux"
  LINUX_SHA = "3927802aaa192382765dce104e0077e63ed9e3737d2f0b38fc7e6a7e9032607a"

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
