class ShellAi < Formula
  desc "A language-agnostic CLI tool that brings AI into your terminal"
  homepage "https://github.com/ShashankIIITN/shell-ai"
  url "https://github.com/ShashankIIITN/shell-ai/archive/refs/tags/v2.2.0-publish-workflow.tar.gz"
  sha256 "d4b262e7cc6b44405ca0b6a7e9f172a60b44dc4be9609be80897488dc518a01d"
  license "MIT"

  def install
    # Install the main CLI script
    bin.install "bin/shell-ai"
    
    # Install backends
    (pkgshare/"backends").install Dir["backends/*.sh"]
    
    # Install shell integration scripts
    pkgshare.install "shell-ai.bash", "shell-ai.fish", "shell-ai.plugin.zsh"
  end

  def caveats
    <<~EOS
      To activate shell-ai, add the following to your shell configuration file:

      For Bash (~/.bashrc):
        source #{opt_pkgshare}/shell-ai.bash

      For Zsh (~/.zshrc):
        source #{opt_pkgshare}/shell-ai.plugin.zsh

      For Fish (~/.config/fish/config.fish):
        source #{opt_pkgshare}/shell-ai.fish
    EOS
  end

  test do
    system "#{bin}/shell-ai", "--help"
  end
end
