"use client";

import { useEffect } from "react";

const SETTINGS_KEY = "ocd-user-settings";

export default function ThemeSync() {
  useEffect(() => {
    try {
      const saved = JSON.parse(localStorage.getItem(SETTINGS_KEY) || "null");
      if (!saved) return;
      if (saved.theme === "light" || saved.theme === "dark") {
        document.documentElement.dataset.theme = saved.theme;
      }
      if (typeof saved.accent === "string" && /^#[0-9a-f]{6}$/i.test(saved.accent)) {
        document.documentElement.style.setProperty("--accent", saved.accent);
        document.documentElement.style.setProperty("--accent-dark", saved.accent);
      }
    } catch {}
  }, []);
  return null;
}
