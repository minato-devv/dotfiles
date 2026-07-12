import * as THREE from 'three';

// Simple 3D Rubik's cube viewer
export default function CubeViewer() {
  const scene = new THREE.Scene();
  const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 100);
  
  // Position camera to see all faces
  camera.position.z = 3;
  
  const renderer = new THREE.WebGLRenderer({ antialias: true });
  renderer.setSize(window.innerWidth, window.innerHeight);
  document.body.appendChild(renderer.domElement);

  // Create cube positions and colors (simplified)
  const positions = [
    { x: -1.5, y: 0, z: -1.5 }, { x: -1.5, y: 0, z: 1.5 },
    { x: -1.5, y: 1.5, z: -1.5 }, { x: -1.5, y: 1.5, z: 1.5 },
    { x: 1.5, y: 0, z: -1.5 }, { x: 1.5, y: 0, z: 1.5 },
    { x: 1.5, y: 1.5, z: -1.5 }, { x: 1.5, y: 1.5, z: 1.5 }
  ];
  
  const colors = [
    'red', 'red', 'green', 'green',
    'blue', 'blue', 'yellow', 'yellow'
  ];

  positions.forEach((pos, i) => {
    const geometry = new THREE.BoxGeometry(0.2, 0.2, 0.2);
    const material = new THREE.MeshStandardMaterial({ color: colors[i] });
    const mesh = new THREE.Mesh(geometry, material);
    mesh.position.set(...pos.map(p => p / 3)); // Scale to unit
    
    scene.add(mesh);
  });

  // Rotation tracking state (TASK 3 INCREMENT)
  let rotationCount = 0;
  const MAX_HISTORY = 10;
  const history = [];
  
  function incrementRotationCount() {
    rotationCount++;
    history.push(`Move ${rotationCount}`);
    if (history.length > MAX_HISTORY) {
      history.shift(); // Remove oldest entry
    }
    
    console.log(`[CubeViewer] Move ${rotationCount} - ${history[0]}`); // TASK 3 VISUAL FEEDBACK
  }

  // Animation loop for basic rotation (not face-specific)
  let angle = 0;
  function animate() {
    requestAnimationFrame(animate);
    angle += 0.01;
    
    const rotateX = new THREE.Matrix4().makeRotationX(angle * 2 / 3);
    const rotateY = new THREE.Matrix4().makeRotationY(angle * 4 / 3);
    
    scene.traverse(child => {
      if (child.isMesh) child.applyMatrix4(rotateX.multiply(rotateY));
    });
    
    renderer.render(scene, camera);
  }

  // Keybind handling for individual face rotation
  const keyMap = {
    'r': 'R', 'u': 'U', 'l': 'L', 'f': 'F', 'd': 'D', 'b': 'B'
  };
  
  window.addEventListener('keydown', (e) => {
    if (keyMap[e.key.toLowerCase()]) {
      e.preventDefault();
      const direction = keyMap[e.key.toLowerCase()];
      
      // Apply rotation based on current face position and track it
      scene.traverse(mesh => {
        if (mesh.isMesh && mesh.position.z >= 0) { // Right faces (F, B)
          if (direction === 'R') applyRotation(mesh, true);
          else if (direction === 'L') applyRotation(mesh, false);
        } else if (mesh.position.y >= 1.5) { // Top faces (U)
          if (direction === 'U') applyRotation(mesh, true);
          else if (direction === 'D') applyRotation(mesh, false);
        } else if (mesh.position.y <= -0.5) { // Bottom faces (D)
          if (direction === 'B') applyRotation(mesh, true);
          else if (direction === 'F') applyRotation(mesh, false);
        }
        
        // Track rotation for visual feedback
        if (mesh.isMesh && mesh.position.z >= 0) {
          incrementRotationCount();
        } else if (mesh.position.y <= -0.5) { // Bottom faces
          incrementRotationCount();
        }
      });
    }
  });

  function applyRotation(mesh, clockwise) {
    const rotation = new THREE.Matrix4().makeRotationY(Math.PI * 2 / 3);
    mesh.applyMatrix4(rotation);
  }

}