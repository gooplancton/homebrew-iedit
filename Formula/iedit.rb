class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.6.0"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.0/iedit-macos-x86_64"
  MACOS_X86_SHA = "a0e43da70f5469ff5e6eabab170b82c3c8606dccef42b9cc022ca94bf16aabc1"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.0/iedit-macos-arm64"
  MACOS_ARM_SHA = "96de8056801771d9df682cc1cfb1a6dcbf8676de14a7acee3504b8966a4a14ac"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.0/iedit-linux"
  LINUX_SHA = "e8a9dcbfeeee4e0be5a5c638a930da8ce06c3cfba8cdefb18a815d11552fbba8"

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
