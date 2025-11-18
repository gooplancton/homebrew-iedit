class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.5.3"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.3/iedit-macos-x86_64"
  MACOS_X86_SHA = "f40e8e64e54d9a17d9ee32db6bdd4beee190aadcab3fb8d8952cbe2b77024f14"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.3/iedit-macos-arm64"
  MACOS_ARM_SHA = "5e8f04449f7a8b04049d4b809f7914dd672518a7217062a0239cb3728bd2fdc9"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.3/iedit-linux"
  LINUX_SHA = "76e99ddec13077833c10306303c020056a1c892385978c910ecd59536d4b02df"

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
