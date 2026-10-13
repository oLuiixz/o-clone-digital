const CACHE = "ocd-pwa-v2";
self.addEventListener("install", event => { self.skipWaiting(); event.waitUntil(caches.open(CACHE)); });
self.addEventListener("activate", event => { event.waitUntil((async()=>{const keys=await caches.keys();await Promise.all(keys.filter(k=>k!==CACHE).map(k=>caches.delete(k)));await self.clients.claim();})()); });
self.addEventListener("fetch", event => {
  if(event.request.method!=="GET" || new URL(event.request.url).origin!==self.location.origin) return;
  event.respondWith(fetch(event.request).then(response=>{if(response.ok && (event.request.destination==="image" || event.request.mode==="navigate")){const copy=response.clone();caches.open(CACHE).then(cache=>cache.put(event.request,copy));}return response;}).catch(()=>caches.match(event.request).then(cached=>cached || (event.request.mode==="navigate"?caches.match("/painel"):undefined))));
});
self.addEventListener("push", event => {
  let data = {};
  try { data = event.data ? event.data.json() : {}; } catch { data = { body: event.data?.text() || "Você tem uma nova atualização." }; }
  const title = data.title || "O Clone Digital";
  const options = {
    body: data.body || "Você tem uma nova notificação.",
    icon: "/imagens/logo-clone-digital.svg",
    badge: "/imagens/logo-clone-digital.svg",
    tag: data.tag || "ocd-notification",
    data: { url: data.url || "/painel" },
    renotify: false,
    requireInteraction: false
  };
  event.waitUntil(self.registration.showNotification(title, options));
});
self.addEventListener("notificationclick", event => {
  event.notification.close();
  const target = new URL(event.notification.data?.url || "/painel", self.location.origin).href;
  event.waitUntil((async () => {
    const windows = await self.clients.matchAll({ type: "window", includeUncontrolled: true });
    for (const client of windows) {
      if (client.url.startsWith(self.location.origin) && "focus" in client) {
        await client.focus();
        if ("navigate" in client && client.url !== target) await client.navigate(target);
        return;
      }
    }
    if (self.clients.openWindow) await self.clients.openWindow(target);
  })());
});
