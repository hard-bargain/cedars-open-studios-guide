# Cedars Open Studios Tour - Route Planner

A digital route planning tool for the annual Cedars Open Studios Tour in Dallas, TX. This application helps visitors plan their optimal route through artist studios, galleries, and creative spaces in the historic Cedars neighborhood.

## 🎨 Features

- **Interactive Map & List Views**: Switch between map visualization and detailed list view
- **Route Optimization**: Automatically calculates the most efficient route through selected studios
- **Personal Planning**: Mark studios as visited, skip unwanted stops, and favorite interesting locations
- **Auto-Save**: Automatically saves your route preferences to GitHub for persistence across sessions
- **Mobile-Friendly**: Responsive design optimized for mobile tour use
- **Offline-Ready**: Works without internet once loaded (except for auto-save)

## 🗓️ Event Information

**Date**: Saturday, November 22, 2025  
**Time**: 11 AM - 6 PM  
**Location**: Cedars Neighborhood, Dallas, TX  
**Website**: [cedarsopenstudios.org](https://www.cedarsopenstudios.org/)

## 🚀 Setup & Usage

### For GitHub Pages Deployment

1. **Enable GitHub Pages**:
   - Go to repository Settings → Pages
   - Select "Deploy from a branch" 
   - Choose "main" branch and "/ (root)"
   - Save settings

2. **Configure GitHub Token** (for auto-save):
   - Create a [Personal Access Token](https://github.com/settings/tokens) with `repo` permissions
   - When prompted by the app, enter your token
   - Token is stored locally for future sessions

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
├── index.html          # Main application
├── data.json          # Tour data and user preferences
└── README.md          # This file
```

## 🔧 Data Structure

The `data.json` file contains:

- **tourConfig**: Event metadata, branding, and configuration
- **studios**: Array of studio/gallery information with coordinates
- **userState**: Saved user preferences (skipped, favorited, visited studios)

### Current Status: Placeholder Data

⚠️ **Important**: Currently using White Rock Lake Artist Studio Tour data as placeholders until the official 2025 Cedars Open Studios route is published.

## 🔄 Updating to Real Cedars Data

When Cedars Open Studios publishes their 2025 tour information:

1. **Gather Official Data**: Collect studio names, addresses, coordinates, and artist information
2. **Update data.json**: Replace the `studios` array with real Cedars data
3. **Update tourConfig**: Set `isPlaceholder: false` and update event details
4. **Test & Deploy**: Verify coordinates and route optimization work correctly

### Data Format for New Studios

```json
{
  "num": 1,
  "name": "Studio Name",
  "address": "Street Address, Dallas, TX",
  "medium": "art medium description",
  "website": "https://artist-website.com",
  "lat": 32.7767,
  "lon": -96.7970
}
```

## 🛠️ Technical Details

- **Frontend**: Vanilla JavaScript, Leaflet.js for maps, Material Icons
- **Maps**: OpenStreetMap with Leaflet
- **Persistence**: GitHub API for cloud storage
- **Styling**: CSS Custom Properties, mobile-first responsive design
- **Offline**: Service Worker ready (can be added for full offline support)

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
