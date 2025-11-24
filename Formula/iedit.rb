class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.6.2"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.2/iedit-macos-x86_64"
  MACOS_X86_SHA = "79c6018117e9a4b1b9dde651d882b130254df120ed5e0a474c8e6ad99edd27d7"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.2/iedit-macos-arm64"
  MACOS_ARM_SHA = "0476e4c7ba18761c78ae0e0c083413b669a2ce60de195e28e519943e54114824"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.2/iedit-linux"
  LINUX_SHA = "deee64a6b63184e4d9937a77b55dc3e7164bea4056170d7b067fd4df1b11924f"

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
