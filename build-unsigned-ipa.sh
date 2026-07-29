#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

if ! command -v xcodegen >/dev/null 2>&1; then
  echo "Missing XcodeGen. Install with: brew install xcodegen"
  exit 1
fi

xcodegen generate
rm -rf build
mkdir -p build/Payload

xcodebuild \
  -project PillOverlay.xcodeproj \
  -scheme PillOverlay \
  -configuration Release \
  -sdk iphoneos \
  -derivedDataPath build/DerivedData \
  CODE_SIGNING_ALLOWED=NO \
  CODE_SIGNING_REQUIRED=NO \
  CODE_SIGN_IDENTITY="" \
  build

APP_PATH="$(find build/DerivedData/Build/Products/Release-iphoneos -maxdepth 1 -name 'PillOverlay.app' -type d | head -n 1)"

if [[ -z "$APP_PATH" ]]; then
  echo "Build succeeded but PillOverlay.app was not found."
  find build/DerivedData/Build/Products -maxdepth 4 -type d || true
  exit 1
fi

cp -R "$APP_PATH" build/Payload/
(
  cd build
  /usr/bin/zip -qry PillOverlay-unsigned.ipa Payload
)

echo "Created: $ROOT/build/PillOverlay-unsigned.ipa"
