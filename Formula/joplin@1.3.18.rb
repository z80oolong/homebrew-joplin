class JoplinAT1318 < Formula
  desc "an open source note taking and to-do application with synchronization capabilities for Windows, Linux, and, etc."
  homepage "https://joplinapp.org/"

  joplin_version = "1.3.18"
  url "https://github.com/laurent22/joplin/releases/download/v#{joplin_version}/Joplin-#{joplin_version}.AppImage"
  sha256 "c7e962599352057b4675a74fc2ab854b844a75c1bf97761cec18a97846f08db6"
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
