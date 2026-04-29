-- Drunk-test demo schema
-- Run this in the Supabase SQL editor of project ykrncghrfhyccztpxzby
-- (or via the Supabase CLI / MCP).

-- Users (anonymous demo users keyed by client-generated UUID)
create table if not exists public.app_users (
  id uuid primary key,
  name text not null,
  created_at timestamptz not null default now()
);

-- One row per finished attempt (tap on red light)
-- Note: pass/fail is intentionally NOT stored here. It is derived in the
-- client from the current threshold (AppConfig.passThresholdMs), so changing
-- the threshold reclassifies all historical attempts consistently.
create table if not exists public.test_results (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.app_users(id) on delete cascade,
  reaction_time_ms integer not null check (reaction_time_ms >= 0),
  created_at timestamptz not null default now()
);

create index if not exists test_results_user_id_idx
  on public.test_results(user_id);

create index if not exists test_results_user_id_reaction_idx
  on public.test_results(user_id, reaction_time_ms asc);

create index if not exists test_results_reaction_idx
  on public.test_results(reaction_time_ms asc);

-- Top-10 leaderboard: top attempts globally (a single user can occupy
-- multiple positions if they have multiple fast attempts).
create or replace view public.leaderboard_top10
with (security_invoker = true) as
select
  r.id          as result_id,
  r.user_id     as user_id,
  u.name        as name,
  r.reaction_time_ms,
  r.created_at
from public.test_results r
join public.app_users u on u.id = r.user_id
order by r.reaction_time_ms asc, r.created_at asc
limit 10;

-- Rank of an arbitrary reaction time across all attempts ever recorded.
create or replace function public.rank_for_time(target_ms integer)
returns integer
language sql
stable
security invoker
set search_path = public
as $$
  select coalesce(
    (select count(*)::int + 1
     from public.test_results
     where reaction_time_ms < target_ms),
    1
  );
$$;

-- RLS: this demo uses the anon key from the client, no auth.
alter table public.app_users enable row level security;
alter table public.test_results enable row level security;

drop policy if exists "anon read users"     on public.app_users;
drop policy if exists "anon insert users"   on public.app_users;
drop policy if exists "anon read results"   on public.test_results;
drop policy if exists "anon insert results" on public.test_results;

create policy "anon read users"
  on public.app_users for select
  to anon, authenticated
  using (true);

create policy "anon insert users"
  on public.app_users for insert
  to anon, authenticated
  with check (true);

create policy "anon read results"
  on public.test_results for select
  to anon, authenticated
  using (true);

create policy "anon insert results"
  on public.test_results for insert
  to anon, authenticated
  with check (true);

-- Allow the leaderboard view and rank function to be queried by anon.
grant select on public.leaderboard_top10 to anon, authenticated;
grant execute on function public.rank_for_time(integer) to anon, authenticated;
