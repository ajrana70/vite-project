/// <reference types="vitest" />
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";

export default defineConfig({
  plugins: [react()],
  test: {
    globals: true, // enables global test APIs like `describe`, `it`, `expect`
    environment: "jsdom", // simulates browser environment for React testing
    setupFiles: "./src/setupTests.ts", // optional, for jest-dom setup
  },
});
