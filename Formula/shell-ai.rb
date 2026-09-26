class ShellAi < Formula
  desc "A language-agnostic CLI tool that brings AI into your terminal"
  homepage "https://github.com/ShashankIIITN/shell-ai"
  url "https://github.com/ShashankIIITN/shell-ai/archive/refs/tags/v2.2.1-publish-workflow-2.tar.gz"
  sha256 "5dd89405d74d5747dee4622d2aab1f8e07949830f3d1f15e3adc285d55dbca17"
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
