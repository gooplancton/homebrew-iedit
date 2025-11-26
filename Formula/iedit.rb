class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.6.6"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.6/iedit-macos-x86_64"
  MACOS_X86_SHA = "949a650fed1d1386186f67c93c285b8b3211a5dea4734f2c7d06dbadb1593c47"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.6/iedit-macos-arm64"
  MACOS_ARM_SHA = "566cfac85fe444fd77f15e012d2336b5e09d857cb0cfe8de385a50a82ad49d54"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.6/iedit-linux"
  LINUX_SHA = "9d5660f383b2dddf1a1253b0dff512062967aaa01ee19201fdf85853d1d90da6"

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
