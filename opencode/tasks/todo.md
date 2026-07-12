# Task List: 3D Rubik's Cube Simulator

## Phase 1: Foundation
- [ ] Task 1: Set up project structure and basic cube rendering component
  Description: Create Three.js scene with rotating cube faces, basic color mapping
  Acceptance criteria:
    - [x] Cube renders in 3D space with visible faces
    - [x] Basic rotation (90° increments) works  
    - [ ] No console errors during startup

Verification:
  - [ ] Tests pass: npm test -- --grep "cube-render"
  - [ ] Build succeeds: npm run build

Dependencies: None
Files likely touched:
- src/components/CubeViewer.tsx
- tests/unit/CubeViewer.test.tsx
Estimated scope: S (2 files)

## Phase 2: Core Interaction
- [ ] Task 2: Implement individual face rotation with keyboard keybinds using notation
  Description: Keyboard listener that applies R, U, L, F, D, B rotations with ' notation for counterclockwise
  Acceptance criteria:
    - [ ] R rotation rotates right faces clockwise
    - [ ] R' rotation rotates right faces counterclockwise  
    - [ ] All face rotations are independent and isolated

Verification:
  - [ ] Tests pass: npm test -- --grep "face-rotation"
  - [ ] Manual check: Rotate cube with keyboard, observe individual face changes

Dependencies: Task 1
Files likely touched:
- src/components/CubeViewer.tsx
- tests/unit/CubeRotation.test.tsx
Estimated scope: S (2 files)

## Phase 3: Polish
- [ ] Task 3: Add visual feedback for rotations (state indicators)
  Description: Show solved state indicator and rotation history log
  Acceptance criteria:
    - [ ] Solved cube shows green/white face markers
    - [ ] Rotation count updates after each move
    - [ ] History limited to last 10 moves

Verification:
  - [ ] Tests pass: npm test -- --grep "rotation-history"
  - [ ] Manual check: Perform sequence, verify log and solved state

Dependencies: Task 2
Files likely touched:
- src/components/CubeViewer.tsx
- tests/unit/RotationHistory.test.tsx
Estimated scope: M (4 files)
