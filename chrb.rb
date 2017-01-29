require 'formula'

class Chrb < Formula
  homepage 'https://github.com/rubinius/chruby#readme'
  url 'https://github.com/rubinius/chruby/archive/v0.3.9.1.tar.gz'
  sha256 'f9c74d29a2294e85d716d107c47477f1a333807f79b5709b9ad4b45a047d64d0'

  head 'https://github.com/rubinius/chruby.git'

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end

  def caveats; <<-EOS.undent
    Add the following to the ~/.bashrc or ~/.zshrc file:

      source #{opt_share}/chruby/chruby.sh

    By default chruby will search for Rubies installed into /opt/rubies/ or
    ~/.rubies/. For non-standard installation locations, simply set the RUBIES
    variable after loading chruby.sh:

      RUBIES+=(
        /opt/jruby-1.7.0
        $HOME/src/rubinius
      )

    If you are migrating from another Ruby manager, set `RUBIES` accordingly:

      RVM:   RUBIES+=(~/.rvm/rubies/*)
      rbenv: RUBIES+=(~/.rbenv/versions/*)
      rbfu:  RUBIES+=(~/.rbfu/rubies/*)

    To enable auto-switching of Rubies specified by .ruby-version files,
    add the following to ~/.bashrc or ~/.zshrc:

      source #{opt_share}/chruby/auto.sh
    EOS
  end
end
