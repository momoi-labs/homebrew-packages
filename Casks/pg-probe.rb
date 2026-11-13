cask "pg-probe" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.1"
  sha256 arm:   "501669b9b3f95b6ea8d7153cd0fd0fc302da3998f8b09dc92dc29b9ea95d446c",
         intel: "adb72ff88409f6a0c72d039b3bb13ed63223fa0e9f71103dda66d53a7466570d"

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
