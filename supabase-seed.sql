-- Seed Data for Cedars Open Studios 2025
-- Run this AFTER running supabase-schema.sql

-- Insert the 2025 tour
insert into public.tours (name, slug, date, hours, description, website, is_active)
values (
  '2025 Cedars Open Studios Tour',
  'cedars-2025',
  'November 22, 2025',
  '11 AM - 6 PM',
  'A beloved tradition for more than two decades! Wander through artists'' studios, galleries, businesses, and creative spaces in the historic Cedars neighborhood.',
  'https://www.cedarsopenstudios.org/',
  true
);

-- Insert all 37 locations for the 2025 tour
-- First, get the tour ID
do $$
declare
  tour_uuid uuid;
begin
  select id into tour_uuid from public.tours where slug = 'cedars-2025';

  insert into public.locations (tour_id, num, name, address, medium, description, website, lat, lon, is_start) values
  (tour_uuid, 1, 'CANVAS Hotel Dallas', '1325 Botham Jean Blvd, Dallas, TX', 'sponsor', '', 'https://www.canvashoteldallas.com/', 32.7785, -96.8000, true),
  (tour_uuid, 2, 'South Side On Lamar', '1409 Botham Jean Blvd, Dallas, TX', 'sponsor - Information, Artist Quarter & Basement', 'Information, Artist Quarter & Basement', '', 32.7765, -96.8000, false),
  (tour_uuid, 3, 'Eros Artspace', '1409 Botham Jean Blvd, Artist Quarter 103, Dallas, TX', 'artist studio', '', '', 32.7765, -96.7998, false),
  (tour_uuid, 4, 'SPARK!', '1409 Botham Jean Blvd, Southside on Lamar Basement, Dallas, TX', 'sponsor', 'Southside on Lamar Basement', '', 32.7765, -96.7996, false),
  (tour_uuid, 5, 'Opening Bell Coffee', '1409 Botham Jean Blvd, South Side On Lamar Basement, Dallas, TX', 'sponsor', 'South Side On Lamar Basement', '', 32.7765, -96.7994, false),
  (tour_uuid, 6, 'ACME Creation Lab', '1219 South Riverfront Blvd, Dallas, TX', 'artist studio', '', '', 32.7755, -96.8085, false),
  (tour_uuid, 7, 'Sandwich Hag & chimielnik Coffee Shop', '1902 Botham Jean Blvd, Dallas, TX', 'sponsor', '', '', 32.7705, -96.8000, false),
  (tour_uuid, 8, 'Autonomous Society', '1705 S. Akard Street, Dallas, TX', 'sponsor', '', '', 32.7725, -96.7965, false),
  (tour_uuid, 9, 'Full City Rooster', '1810 S. Akard Street, Suite 100, Dallas, TX', 'sponsor', '', '', 32.7715, -96.7965, false),
  (tour_uuid, 10, 'parmadesign', '1712 S. Akard Street, Dallas, TX', 'sponsor', '', '', 32.7735, -96.7965, false),
  (tour_uuid, 11, 'Lee Harvey''s', '1807 Gould Street, Dallas, TX', 'sponsor', '', '', 32.7720, -96.7920, false),
  (tour_uuid, 12, 'Lee Harvey''s Dive In', '1315 Beaumont Street, Dallas, TX', 'sponsor', '', '', 32.7760, -96.7905, false),
  (tour_uuid, 13, 'The Cedars Sage & Her Telling Typewriter', '1708 Gould Street, Dallas, TX', 'artist studio', '', '', 32.7728, -96.7920, false),
  (tour_uuid, 14, 'Cedars Art House', '1712 Gould Street, Dallas, TX', 'artist studio', '', '', 32.7725, -96.7920, false),
  (tour_uuid, 15, 'Movement Gallery', '1419 Beaumont Street, Suite 1, Dallas, TX', 'sponsor', '', '', 32.7745, -96.7905, false),
  (tour_uuid, 16, 'Preservation Dallas', '1419 Beaumont Street, Suite 1, Dallas, TX', 'sponsor - Information', 'Information', '', 32.7745, -96.7903, false),
  (tour_uuid, 17, 'Glamour Puss Artistic Gallery', '1508 Beaumont Street, Dallas, TX', 'sponsor - Hair studio', 'Hair studio', '', 32.7735, -96.7905, false),
  (tour_uuid, 18, 'The Powhattan House', '1214 Powhattan Street, Dallas, TX', 'artist studio', '', '', 32.7775, -96.7895, false),
  (tour_uuid, 19, 'Griffin Street Studios', '1204 Griffin Street West, Dallas, TX', 'artist studio', '', '', 32.7780, -96.7890, false),
  (tour_uuid, 20, 'Tin Ranch Studios', '1419 Griffin Street East, Dallas, TX', 'artist studio', '', '', 32.7750, -96.7885, false),
  (tour_uuid, 21, 'Cedars Union', '1219 S. Ervay Street, Dallas, TX', 'sponsor', '', '', 32.7780, -96.7935, false),
  (tour_uuid, 22, 'Four Corners Brewery', '1311 S. Ervay Street, Dallas, TX', 'sponsor - Food, Closing Show', 'Food, Closing Show', '', 32.7765, -96.7935, false),
  (tour_uuid, 23, 'The Stewpot', '1311 S. Ervay Street, Dallas, TX', 'artist studio - Information', 'Information', '', 32.7765, -96.7933, false),
  (tour_uuid, 24, 'City Park', '1515 S. Harwood Street, Dallas, TX', 'sponsor', '', '', 32.7745, -96.7875, false),
  (tour_uuid, 25, 'Avy''s Sunshine Tribe', '1515 S. Harwood Street, Dallas, TX', 'artist studio', '', '', 32.7745, -96.7873, false),
  (tour_uuid, 26, 'Mesquite Arts Center', '1515 S. Harwood Street, Dallas, TX', 'sponsor', '', '', 32.7745, -96.7871, false),
  (tour_uuid, 27, 'Firefly Metal Works', '1507 Sullivan Drive, Dallas, TX', 'sponsor', '', '', 32.7748, -96.7865, false),
  (tour_uuid, 28, 'Marcello Andres Ceramics', '1501 Gano Street #3C, Dallas, TX', 'artist studio', '', 'https://marcelloandres.com', 32.7755, -96.7880, false),
  (tour_uuid, 29, 'Gano Street Studios', '1517 Gano Street, Dallas, TX', 'artist studio', '', '', 32.7750, -96.7880, false),
  (tour_uuid, 30, 'Harmony Bank', '1900 South Ervay Street, Dallas, TX', 'sponsor', '', '', 32.7695, -96.7935, false),
  (tour_uuid, 31, 'Rule Six Studio', '2527 Gano Street, Dallas, TX', 'artist studio', '', '', 32.7640, -96.7880, false),
  (tour_uuid, 32, 'American Beauty Mill Lofts', '2400 S. Ervay Street, Dallas, TX', 'sponsor', '', '', 32.7655, -96.7935, false),
  (tour_uuid, 33, 'Mike''s Gemini Twins', '1906 S. Harwood Street, Dallas, TX', 'sponsor', '', '', 32.7695, -96.7875, false),
  (tour_uuid, 34, 'Good Coworking', '1808 S. Good Latimer Expwy, Dallas, TX', 'sponsor', '', '', 32.7710, -96.7835, false),
  (tour_uuid, 35, 'Nostalgia Studio', '1808 S. Good Latimer Expwy, Dallas, TX', 'artist studio', '', '', 32.7710, -96.7833, false),
  (tour_uuid, 36, 'Tractorbeam', '1526 S. Good Latimer Expwy, Dallas, TX', 'sponsor', '', '', 32.7745, -96.7835, false),
  (tour_uuid, 37, 'Jamaica Cabana', '1835 S. Harwood Street, Dallas, TX', 'sponsor', '', '', 32.7702, -96.7875, false);
end $$;
