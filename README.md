# Running The Project

## Requirements
- **Qt Creator 11.0.3**
- **Qt Design Studio 4.3.1** or similar versions.

Ensure to select **QtQuick** and **QtQuick3D** packages during installation. In case of dependency problems, use the **Qt Maintenance Tool** to install the problematic packages.

## Project Setup

1. For Qt Creator:
   - Place `asset_imports/Quick3DAssets/BallOnPlateModel` model to `buildRoot/qml/`
   - Execute the project within Qt Creator.

2. For Qt Design Studio:
   - Modify import statement in `App.qml`:
     ```qml
     import BallOnPlateModel
     ```
     to
     ```qml
     import Quick3DAssets.BallOnPlateModel
     ```

**Note:** The project is tested on **Windows 11**.
