class JoplinCliAT142 < Formula
  desc "an open source note taking and to-do application with synchronization capabilities for Windows, Linux, and, etc."
  homepage "https://joplinapp.org/"

  joplin_version = "1.4.2"

  url "https://registry.npmjs.org/joplin/-/joplin-#{joplin_version}.tgz"
  sha256 "faf1a2d31a093ec16d923276b09ae0d86ff8fcbde520763f478bf45f50f0bf4d"
  version joplin_version

  keg_only :versioned_formula

  depends_on "python@3.8" => :build
  depends_on "nodeenv" => :build
  depends_on "libsecret"

  def install
    nodejs_version = "14.10.0"
    libexec.mkdir; bin.mkdir

    system "#{Formula["python@3.8"].opt_bin}/python3", "#{Formula["nodeenv"].opt_bin}/nodeenv", "--node=#{nodejs_version}", "#{libexec}/nodejs"

    ENV["PATH"] = "#{libexec}/nodejs/bin:#{ENV["PATH"]}"
    system "cp", "-pR", "#{buildpath}", "#{libexec}/joplin"
    system "#{libexec}/nodejs/bin/npm", "-g", "install", "--prefix", "#{libexec}/nodejs", "#{libexec}/joplin"

    (bin/"joplin-cli").make_symlink (libexec/"nodejs/bin/joplin")
  end

  def caveats
    <<~EOS
      This Joplin CLI client must be started using the "joplin-cli" command instead of the "joplin" command.
      For example, run
        #{opt_bin}/joplin-cli
    EOS
  end
end
