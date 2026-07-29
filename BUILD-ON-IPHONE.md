# Build using only an iPhone

1. Create a GitHub repository.
2. Upload every file and folder from this project to the repository root.
3. Verify these paths exist:
   - `project.yml`
   - `.github/workflows/Building.yml`
   - `PillActivityAttributes.swift`
   - `PillOverlayLiveActivity.swift`
4. Open the repository's **Actions** tab.
5. Select **Build Unsigned IPA** and tap **Run workflow**.
6. After the run succeeds, download the artifact named `PillOverlay-unsigned-ipa`.
7. Extract the downloaded artifact ZIP to get `PillOverlay-unsigned.ipa`.

The IPA is unsigned and must be signed before stock iOS will install it.
