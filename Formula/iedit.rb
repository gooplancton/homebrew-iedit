class Iedit < Formula
  desc "Minimal text editor that opens alongside the scrollback buffer"
  homepage "https://github.com/gooplancton/iedit"
  version "0.6.4"

  MACOS_X86_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.4/iedit-macos-x86_64"
  MACOS_X86_SHA = "15f7e1aeabc89f9783a30a7100296aa2f5526412ce01b6004b42c0c07666496a"

  MACOS_ARM_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.4/iedit-macos-arm64"
  MACOS_ARM_SHA = "2fe85b42c3d57b225a6f633f8eef92cea05ef9400a6310d6c46f85589a934246"

  LINUX_URL = "https://github.com/gooplancton/iedit/releases/download/v0.6.4/iedit-linux"
  LINUX_SHA = "d70afb012f36a0aafcc6c9c4775fe02db2f448dbc1d74a17d9e812b669cd3313"

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
