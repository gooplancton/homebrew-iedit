class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.5.0"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.0/iedit-macos-x86_64"
  MACOS_X86_SHA = "1ed47080fc5dbb7f899be8c51d897a2d21bd9e1c6306c014a59d4c1f835c86c9"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.0/iedit-macos-arm64"
  MACOS_ARM_SHA = "6b1afaac0bbb83f6bac254492dbabc766be3ea1ce486989ad847c07f25d2c0e5"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.0/iedit-linux"
  LINUX_SHA = "b14e7c3cfb3b5f2194fbf80809ff025c8ee900b5a63ab5561fed71e62b422eec"

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
