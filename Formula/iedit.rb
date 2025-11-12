class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.4.5"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.5/iedit-macos-x86_64"
  MACOS_X86_SHA = "a2c2235fb9b992dd68091e851ddf8cf62541a32455a9b4079ebcbd01d9f46573"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.5/iedit-macos-arm64"
  MACOS_ARM_SHA = "84990e1add17247da476f12931130bdc2c0fa83b0dd01b02da3eef64b4438a22"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.4.5/iedit-linux"
  LINUX_SHA = "b635b53ef0b2a053700f22db7d8a5574c6220e11c1e29229873d9f1e7a3171eb"

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
