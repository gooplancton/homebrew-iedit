class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.5.1"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.1/iedit-macos-x86_64"
  MACOS_X86_SHA = "91a74988ed1e03fce8ea3b562fdd0e2ca12a2594368e606027ca876a7e1e187c"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.1/iedit-macos-arm64"
  MACOS_ARM_SHA = "c82845b30c03a91a918a055c7bfce86b036e84b4b7c1c38aa22ff6df78398e03"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.1/iedit-linux"
  LINUX_SHA = "55b63ce9b5b4926e6d04add902190269f11568210022cf04d023d8d3244e762c"

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
