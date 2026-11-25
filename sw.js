self.addEventListener('install',()=>self.skipWaiting());
self.addEventListener('fetch',e=>{if(e.request.method!='GET'||new URL(e.request.url).origin!=location.origin)return;
e.respondWith(fetch(e.request).then(r=>{const c=r.clone();caches.open('kita').then(x=>x.put(e.request,c));return r}).catch(()=>caches.match(e.request)))});
