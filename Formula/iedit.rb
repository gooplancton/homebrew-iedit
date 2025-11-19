class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.6.1"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.1/iedit-macos-x86_64"
  MACOS_X86_SHA = "bb2e053f76ee39867aee14bf7d10947655a00cb9330c9e53def138c72228e4d5"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.1/iedit-macos-arm64"
  MACOS_ARM_SHA = "6ac114b366904e5f7ef67c504e70c9bc89fec14a8a3c027dda166b747f9a03e4"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.1/iedit-linux"
  LINUX_SHA = "1d968573a3a48daa23b89e88e75fca0d9892be90868f99a91a08d4cb65271330"

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
