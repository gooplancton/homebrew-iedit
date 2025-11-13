class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.4.9"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.9/iedit-macos-x86_64"
  MACOS_X86_SHA = "758a7b39b2ab5e9940ad6e0f7c1472ad14be356d91d74ee24b90fbbfea232921"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.9/iedit-macos-arm64"
  MACOS_ARM_SHA = "89fddb6761be0ef2b2c880cc7e25e0be2dc6d96a0dce8acd689a479f76892263"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.9/iedit-linux"
  LINUX_SHA = "61fcd0b3d8a2d94c0730c2dc96c5c5b8772452a61e3e48361760ff327e4a58ea"

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
