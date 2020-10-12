class JoplinAT123 < Formula
  desc "an open source note taking and to-do application with synchronization capabilities for Windows, Linux, and, etc."
  homepage "https://joplinapp.org/"

  joplin_version = "1.2.3"
  url "https://github.com/laurent22/joplin/releases/download/v#{joplin_version}/Joplin-#{joplin_version}.AppImage"
  sha256 "f2cf57538c81e3f2369d3c51d8328f9c278a302da3eb2dbee6b220edc4efe51a"
  version joplin_version

  keg_only :versioned_formula

  option "with-extract", "Extract Joplin AppImage."

  def install
    (buildpath/"Joplin-#{version}.AppImage").chmod(0755)
    bin.mkdir; libexec.mkdir

    if build.with?("extract") then
      libexec.cd do
        system "#{buildpath}/Joplin-#{version}.AppImage", "--appimage-extract"
      end
      inreplace (libexec/"squashfs-root/AppRun").to_s, /^THIS=.*$/, %{THIS="$0"; APPDIR=""}

      (bin/"joplin").make_symlink (libexec/"squashfs-root/AppRun")
    else
      libexec.install "#{buildpath}/Joplin-#{version}.AppImage"
      (bin/"joplin").make_symlink (libexec/"Joplin-#{version}.AppImage")
    end
  end
end
