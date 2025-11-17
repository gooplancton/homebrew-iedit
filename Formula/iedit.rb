class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.5.2"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.2/iedit-macos-x86_64"
  MACOS_X86_SHA = "aaa87765cd1aac05320d405b5e0e07e2fddca836beccbd8eb1287635c0701034"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.2/iedit-macos-arm64"
  MACOS_ARM_SHA = "52c873177442ed5d0a6b3a158477197bc9adc6485c3bd34db87a5359a45575b6"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.5.2/iedit-linux"
  LINUX_SHA = "e40aaab32c8f18428c432bb9d91e88c39224802a8957f3525e18c54d21dba41f"

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
