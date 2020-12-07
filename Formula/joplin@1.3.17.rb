class JoplinAT1317 < Formula
  desc "an open source note taking and to-do application with synchronization capabilities for Windows, Linux, and, etc."
  homepage "https://joplinapp.org/"

  joplin_version = "1.3.17"
  url "https://github.com/laurent22/joplin/releases/download/v#{joplin_version}/Joplin-#{joplin_version}.AppImage"
  sha256 "5057dce774d3ec004703666b1c76c55de33eee5fd69b216422714f2298cba751"
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
      inreplace (libexec/"squashfs-root/AppRun").to_s, /^THIS=.*$/, %{THIS="$0"; APPDIR="#{libexec}/squashfs-root"}

      (bin/"joplin").make_symlink (libexec/"squashfs-root/AppRun")
    else
      libexec.install "#{buildpath}/Joplin-#{version}.AppImage"
      (bin/"joplin").make_symlink (libexec/"Joplin-#{version}.AppImage")
    end
  end
end
