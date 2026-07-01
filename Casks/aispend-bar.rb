cask "aispend-bar" do
  version "0.0.0-rc2"
  sha256 "128453c4c3eecd6f029015207f46d40ace611b0bb77cc0b53270f08c92bc98d0"

  url "https://github.com/cloudyali/ai-agent-spend/releases/download/v#{version}/aispend-bar-#{version}.dmg"
  name "aispend"
  desc "Menu-bar view of your AI-coding spend, ROI, and cache savings"
  homepage "https://github.com/cloudyali/ai-agent-spend"

  depends_on macos: ">= :monterey"
  app "aispend-bar.app"

  # Phase 1 (unsigned): strip the quarantine bit so Gatekeeper opens it. Remove once the
  # app is Developer-ID-signed + notarized.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/aispend-bar.app"]
  end
end
