cask "trove" do
  version "0.1.0"
  sha256 "73172c131eb152dd470ff24398e0334af2168de7c82c6cbf95aa22582abc998b"

  url "https://github.com/gorkemblm/trove/releases/download/v#{version}/Trove-#{version}.dmg"
  name "Trove"
  desc "Encrypted clipboard history"
  homepage "https://gorkemblm.github.io/trove/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Trove.app"

  # The history itself lives in the folder chosen in Trove's setup and is not removed here.
  zap trash: [
    "~/Library/Application Scripts/com.iokoda.clipboard",
    "~/Library/Containers/com.iokoda.clipboard",
  ]
end
