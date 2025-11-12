class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.4.7"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.7/iedit-macos-x86_64"
  MACOS_X86_SHA = "fa3f63c6bb188430e85a5bc8d72c6f9fd071cb111c764c6167fff6a117436426"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.7/iedit-macos-arm64"
  MACOS_ARM_SHA = "5982a1e906705a7fb0ed4c877993433adad6df0791048233cba4593df1ed96d1"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.7/iedit-linux"
  LINUX_SHA = "f0e0e6a86c9d6393229a42c7d589b86276c5efa7a5715a09e76e01e84ed64528"

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
