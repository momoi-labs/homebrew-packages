cask "pg-probe" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "435904cb1223b5f5ba39baaab44332b07079f0c214fd6f31261221bafd0e09a9",
         intel: "f5b7440d2c3ecf617aabf1892729fc6f74c9138d6627754cbecff45889e0fe45"

  url "https://dl.pg-probe.dev/v#{version}/pg-probe-v#{version}-#{arch}-apple-darwin.tar.gz"
  name "pg-probe"
  desc "Review PostgreSQL and Linux diagnostic snapshots"
  homepage "https://pg-probe.dev"

  binary "pg-probe-v#{version}-#{arch}-apple-darwin/pg-probe"

  # The binary is not Apple-notarized.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path.to_s]
  end
end
