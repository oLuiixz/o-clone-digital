"use client";

import { useEffect, useState } from "react";

export default function CommunityUnreadBadge({ memberId, mobile = false }) {
  const [count, setCount] = useState(0);
  useEffect(() => {
    if (!memberId) return;
    const key = "ocd-community-read-" + memberId;
    const readAt = () => {
      const value = localStorage.getItem(key);
      if (value) return value;
      const now = new Date().toISOString();
      localStorage.setItem(key, now);
      return now;
    };
    let active = true;
    const refresh = async () => {
      try {
        const response = await fetch("/api/community?unreadSince=" + encodeURIComponent(readAt()), { cache: "no-store" });
        if (!response.ok) return;
        const data = await response.json();
        if (active) setCount(Math.max(0, Number(data.count) || 0));
      } catch {}
    };
    refresh();
    const timer = setInterval(refresh, 10000);
    const onFocus = () => refresh();
    window.addEventListener("focus", onFocus);
    return () => { active = false; clearInterval(timer); window.removeEventListener("focus", onFocus); };
  }, [memberId]);
  if (!count) return null;
  const label = count > 100 ? "+100" : String(count);
  return <span className={mobile ? "community-unread-badge is-mobile" : "community-unread-badge"} aria-label={count + " mensagens não lidas"}>{label}</span>;
}
