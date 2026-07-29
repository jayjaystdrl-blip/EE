# PillOverlay

This project builds an iOS app with:

- A draggable pill-shaped overlay inside the app.
- Local notification testing.
- A Live Activity and Dynamic Island extension using ActivityKit and WidgetKit.
- A GitHub Actions workflow that produces an unsigned IPA artifact.

## Build on GitHub

1. Upload all files in this folder to the root of a GitHub repository.
2. Confirm `.github/workflows/Building.yml` exists.
3. Open **Actions** and run **Build Unsigned IPA**.
4. Download the `PillOverlay-unsigned-ipa` artifact after the build succeeds.

The IPA is unsigned and must be signed before installation on stock iOS.

A normal iOS app cannot display a permanent overlay over other apps or access other apps' notifications. Live Activities are the supported system mechanism for ongoing status on the Lock Screen and Dynamic Island.
