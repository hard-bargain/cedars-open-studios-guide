# Cedars Open Studios Tour - Route Planner

A digital route planning tool for the annual Cedars Open Studios Tour in Dallas, TX. This application helps visitors plan their optimal route through artist studios, galleries, and creative spaces in the historic Cedars neighborhood.

## 🎨 Features

- **Interactive Map & List Views**: Switch between map visualization and detailed list view
- **Route Optimization**: Automatically calculates the most efficient route through selected studios
- **Personal Planning**: Mark studios as visited, skip unwanted stops, and favorite interesting locations
- **Notes & Ratings**: Add personal notes and rate each location (with Supabase)
- **Auto-Save**: Automatically saves your progress (locally or to Supabase cloud)
- **Mobile-Friendly**: Responsive design optimized for mobile tour use
- **No Login Required**: Anonymous authentication means users can start using immediately

## 🗓️ Event Information

**Date**: Saturday, November 22, 2025
**Time**: 11 AM - 6 PM
**Location**: Cedars Neighborhood, Dallas, TX
**Website**: [cedarsopenstudios.org](https://www.cedarsopenstudios.org/)

## 🚀 Setup & Usage

### Quick Start (Offline Mode)

The app works out of the box without any configuration:

1. **Enable GitHub Pages**:
   - Go to repository Settings → Pages
   - Select "Deploy from a branch"
   - Choose "main" branch and "/ (root)"
   - Save settings

2. **Visit your site**: `https://yourusername.github.io/cedars-open-studios-guide`

In offline mode, user preferences are saved to the browser's localStorage.

### Cloud Mode (Supabase Integration)

For multi-device sync and cloud storage of user data, set up Supabase:

#### Step 1: Create Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a free account
2. Create a new project
3. Wait for the project to be provisioned

#### Step 2: Set Up Database

1. Go to **SQL Editor** in your Supabase dashboard
2. Run the contents of `supabase-schema.sql` to create tables
3. Run the contents of `supabase-seed.sql` to add the 2025 tour data

#### Step 3: Enable Anonymous Auth

1. Go to **Authentication** → **Providers**
2. Enable **Anonymous Sign-ins**

#### Step 4: Configure the App

Edit `index.html` and replace the placeholder values:

```javascript
const SUPABASE_URL = 'https://your-project-id.supabase.co';
const SUPABASE_ANON_KEY = 'your-anon-key-here';
```

Find these values in your Supabase dashboard under **Settings** → **API**.

### For Local Development

```bash
# Clone the repository
git clone https://github.com/yourusername/cedars-open-studios-guide.git
cd cedars-open-studios-guide

# Serve locally (Python example)
python -m http.server 8000

# Or use any local server
# Visit http://localhost:8000
```

## 📁 Project Structure

```
cedars-open-studios-guide/
├── index.html              # Main application
├── data.json               # Tour data (fallback for offline mode)
├── supabase-schema.sql     # Database schema for Supabase
├── supabase-seed.sql       # Initial tour data for Supabase
└── README.md               # This file
```

## 🗄️ Database Schema

When using Supabase, the following tables are created:

- **tours**: Tour metadata (name, date, description)
- **locations**: Studio/sponsor locations with coordinates
- **user_visits**: Per-user visited/skipped/favorited status
- **user_notes**: Per-user notes for each location
- **user_ratings**: Per-user ratings (1-5 stars) for each location

## 🔧 Managing Tour Data

### Adding a New Year's Tour

1. Insert a new tour in the `tours` table
2. Set `is_active = false` for old tours
3. Set `is_active = true` for the new tour
4. Add locations to the `locations` table with the new tour's ID

### Updating Locations

You can update locations directly in the Supabase dashboard:
1. Go to **Table Editor** → **locations**
2. Edit, add, or remove locations as needed

## 🛠️ Technical Details

- **Frontend**: Vanilla JavaScript, Leaflet.js for maps, Material Icons
- **Maps**: OpenStreetMap with Leaflet
- **Database**: Supabase (PostgreSQL) with Row Level Security
- **Authentication**: Supabase Anonymous Auth (no user signup required)
- **Styling**: CSS Custom Properties, mobile-first responsive design

## 🔒 Security

- **Row Level Security (RLS)**: Users can only read/write their own data
- **Anonymous Auth**: Users get a unique ID without providing credentials
- **Public Anon Key**: Safe to expose in client-side code (RLS protects data)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test locally
5. Commit changes: `git commit -m 'Add feature'`
6. Push to branch: `git push origin feature-name`
7. Create a Pull Request

## 📧 Contact

For questions about the Cedars Open Studios Tour:
- **Tour Information**: [cedarsopenstudios.org](https://www.cedarsopenstudios.org/)
- **Artist Registration**: artists@cedarsopenstudios.org

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Made with ❤️ for the Dallas arts community**
