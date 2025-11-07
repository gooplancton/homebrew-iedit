class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.3.3"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.3/iedit-macos-x86_64"
  MACOS_X86_SHA = "b717fde03d6ac9af78de69770a6775da790cb7c6de17de28b4da7e9b0aa0dbc4"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.3/iedit-macos-arm64"
  MACOS_ARM_SHA = "6b959ffe4a16e6a13e4abb9f9daf04c52d2acc9b63358d111af70b24c3968dc0"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.3/iedit-linux"
  LINUX_SHA = "481e509d1259d331c5f26c1cc8b037108d82dd0962969ee0df162f4432005ce2"

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
