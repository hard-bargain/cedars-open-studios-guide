-- Supabase Schema for Cedars Open Studios Guide
-- Run this in your Supabase SQL Editor (Database > SQL Editor)

-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- ============================================
-- TOURS TABLE (managed by you)
-- ============================================
create table public.tours (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  slug text unique not null, -- e.g., 'cedars-2025', 'cedars-2024'
  date text not null,
  hours text not null,
  description text,
  website text,
  is_active boolean default false, -- only one tour should be active at a time
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- ============================================
-- LOCATIONS TABLE (managed by you)
-- ============================================
create table public.locations (
  id uuid default uuid_generate_v4() primary key,
  tour_id uuid references public.tours(id) on delete cascade not null,
  num integer not null,
  name text not null,
  address text not null,
  medium text, -- 'artist studio', 'sponsor', etc.
  description text,
  website text,
  lat decimal(10, 6) not null,
  lon decimal(10, 6) not null,
  is_start boolean default false,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,

  unique(tour_id, num) -- each tour has unique location numbers
);

-- ============================================
-- USER VISITS TABLE (per-user data)
-- ============================================
create table public.user_visits (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid not null, -- anonymous user ID from Supabase auth
  location_id uuid references public.locations(id) on delete cascade not null,
  visited boolean default false,
  skipped boolean default false,
  favorited boolean default false,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,

  unique(user_id, location_id) -- one record per user per location
);

-- ============================================
-- USER RATINGS TABLE (per-user data)
-- ============================================
create table public.user_ratings (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid not null,
  location_id uuid references public.locations(id) on delete cascade not null,
  rating integer check (rating >= 1 and rating <= 5),
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,

  unique(user_id, location_id)
);

-- ============================================
-- USER NOTES TABLE (per-user data)
-- ============================================
create table public.user_notes (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid not null,
  location_id uuid references public.locations(id) on delete cascade not null,
  note text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,

  unique(user_id, location_id)
);

-- ============================================
-- ROW LEVEL SECURITY (RLS) POLICIES
-- ============================================

-- Enable RLS on all tables
alter table public.tours enable row level security;
alter table public.locations enable row level security;
alter table public.user_visits enable row level security;
alter table public.user_ratings enable row level security;
alter table public.user_notes enable row level security;

-- Tours: Anyone can read
create policy "Tours are viewable by everyone"
  on public.tours for select
  using (true);

-- Locations: Anyone can read
create policy "Locations are viewable by everyone"
  on public.locations for select
  using (true);

-- User visits: Users can only see/modify their own data
create policy "Users can view their own visits"
  on public.user_visits for select
  using (auth.uid() = user_id);

create policy "Users can insert their own visits"
  on public.user_visits for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own visits"
  on public.user_visits for update
  using (auth.uid() = user_id);

create policy "Users can delete their own visits"
  on public.user_visits for delete
  using (auth.uid() = user_id);

-- User ratings: Users can only see/modify their own data
create policy "Users can view their own ratings"
  on public.user_ratings for select
  using (auth.uid() = user_id);

create policy "Users can insert their own ratings"
  on public.user_ratings for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own ratings"
  on public.user_ratings for update
  using (auth.uid() = user_id);

create policy "Users can delete their own ratings"
  on public.user_ratings for delete
  using (auth.uid() = user_id);

-- User notes: Users can only see/modify their own data
create policy "Users can view their own notes"
  on public.user_notes for select
  using (auth.uid() = user_id);

create policy "Users can insert their own notes"
  on public.user_notes for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own notes"
  on public.user_notes for update
  using (auth.uid() = user_id);

create policy "Users can delete their own notes"
  on public.user_notes for delete
  using (auth.uid() = user_id);

-- ============================================
-- INDEXES FOR PERFORMANCE
-- ============================================
create index idx_locations_tour_id on public.locations(tour_id);
create index idx_user_visits_user_id on public.user_visits(user_id);
create index idx_user_visits_location_id on public.user_visits(location_id);
create index idx_user_ratings_user_id on public.user_ratings(user_id);
create index idx_user_notes_user_id on public.user_notes(user_id);

-- ============================================
-- HELPER FUNCTION: Update timestamp on change
-- ============================================
create or replace function public.handle_updated_at()
returns trigger as $$
begin
  new.updated_at = timezone('utc'::text, now());
  return new;
end;
$$ language plpgsql;

-- Apply updated_at trigger to all tables
create trigger handle_tours_updated_at
  before update on public.tours
  for each row execute function public.handle_updated_at();

create trigger handle_locations_updated_at
  before update on public.locations
  for each row execute function public.handle_updated_at();

create trigger handle_user_visits_updated_at
  before update on public.user_visits
  for each row execute function public.handle_updated_at();

create trigger handle_user_ratings_updated_at
  before update on public.user_ratings
  for each row execute function public.handle_updated_at();

create trigger handle_user_notes_updated_at
  before update on public.user_notes
  for each row execute function public.handle_updated_at();
