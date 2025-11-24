class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.6.3"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.3/iedit-macos-x86_64"
  MACOS_X86_SHA = "a3a9bfe9529b6b103fd0d0635d0022be0367045683d35b2a593722067f2b769f"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.3/iedit-macos-arm64"
  MACOS_ARM_SHA = "eeecba734edb1019cee19f7fe6ac4e7a7ecd4f007bf73cc15f0c707c17485ac1"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.3/iedit-linux"
  LINUX_SHA = "cd10fbae1f2c0d0f82d33c51c45488d34a5074eb399245a71663bee45f3a12a7"

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
