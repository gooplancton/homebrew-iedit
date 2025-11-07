class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.3.1"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.1/iedit-macos-x86_64"
  MACOS_X86_SHA = "bbde9cfb0f54498b57f3002adbe2e89e7f65554009a43fcbc76e87ab8eb1f2de"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.1/iedit-macos-arm64"
  MACOS_ARM_SHA = "e734b6d1cb95837bbc5354366171b0bf231d97f2be4e788536d0a6a7162c4d1b"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.3.1/iedit-linux"
  LINUX_SHA = "faaaa5e7e5894b6d780660455a05275c03ee999565c1dbb695d7b55062a3336f"

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
