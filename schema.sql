create table items(id uuid primary key default gen_random_uuid(), kind text not null, data jsonb not null, created_at timestamptz default now());
grant select, insert, update, delete on public.items to authenticated;
alter table items enable row level security;
create policy "kami berdua" on items for all to authenticated using (true) with check (true);
insert into storage.buckets (id, name, public) values ('photos','photos',false);
create policy "gambar kami" on storage.objects for all to authenticated using (bucket_id='photos') with check (bucket_id='photos');
