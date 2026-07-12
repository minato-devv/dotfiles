// Minimal unit test for CubeViewer component
import React from 'react';
import { render, screen } from '@testing-library/react';

test('CubeViewer renders without errors', () => {
  // This is a minimal check - real tests would require Three.js setup
  // We'll verify the component doesn't throw on mount
  const { container } = render(<CubeViewer />);
  
  // Check that some element exists (if JSX renders something)
  expect(container).toBeDefined();
});

test('Component exports default function', () => {
  const fn = require('./CubeViewer');
  expect(typeof fn.default).toBe('function');
});