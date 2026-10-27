cask "pg-probe" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.0"
  sha256 arm:   "732bea6abea5f41d14ddbe9b66abb661397757697bd950de85dd2e8b73cb802d",
         intel: "6fe11a07a0f4b921ae3704942f141a7045c3bc865b05c4610a6d2a3c20adcfbc"

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
