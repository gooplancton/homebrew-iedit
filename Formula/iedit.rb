class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.4.1"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.1/iedit-macos-x86_64"
  MACOS_X86_SHA = "97aa8454d4e14763e722188c6492e6ede0b03d920f4c4dbd9d7659d45fb1949f"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.1/iedit-macos-arm64"
  MACOS_ARM_SHA = "8b1a195e5203685bffb034bebc92b0301fcc552a9cbf7870d5fdbf561c41dc00"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.1/iedit-linux"
  LINUX_SHA = "766d4ddf353eca0e6af24a7a51c8053624ef68f61ef1427101e9ceddc688a8b9"

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
