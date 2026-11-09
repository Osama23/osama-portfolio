'use strict';

self.addEventListener('install', () => {
  self.skipWaiting();
});

self.addEventListener('activate', (event) => {
  event.waitUntil((async () => {
    const keys = await caches.keys();
    await Promise.all(keys.map((key) => caches.delete(key)));
    await self.clients.claim();
    const clients = await self.clients.matchAll({type: 'window'});
    for (const client of clients) {
      if (!client.url || !('navigate' in client)) continue;
      const url = new URL(client.url);
      url.searchParams.set('oa', '7');
      await client.navigate(url.toString());
    }
  })());
});

self.addEventListener('fetch', (event) => {
  event.respondWith(fetch(event.request, {cache: 'no-store'}));
});
