const CACHE = "ocd-pwa-v1";
self.addEventListener("install", event => { self.skipWaiting(); event.waitUntil(caches.open(CACHE)); });
self.addEventListener("activate", event => { event.waitUntil((async()=>{const keys=await caches.keys();await Promise.all(keys.filter(k=>k!==CACHE).map(k=>caches.delete(k)));await self.clients.claim();})()); });
self.addEventListener("fetch", event => {
  if(event.request.method!=="GET" || new URL(event.request.url).origin!==self.location.origin) return;
  event.respondWith(fetch(event.request).then(response=>{if(response.ok && (event.request.destination==="image" || event.request.mode==="navigate")){const copy=response.clone();caches.open(CACHE).then(cache=>cache.put(event.request,copy));}return response;}).catch(()=>caches.match(event.request).then(cached=>cached || (event.request.mode==="navigate"?caches.match("/painel"):undefined))));
});