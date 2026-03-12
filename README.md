# 🔧 Scrap Yard Business

> *Want more scripts like this join https://discord.gg/Z75wwvsDgs*

> *A fully interactive scrapyard system for FiveM servers.  
> Players can scrap cars anywhere in the world and sell collected materials to a Scrap Yard NPC.*

---

## 🔧 Features

- Scrap **cars only** to collect materials  
- Collect scrap **anywhere** on the map  
- Multiple scrap types:  
  - Steel, Rubber, Metal Scrap, Iron, Copper, Aluminum, Plastic  
- NPC buyer to sell collected scrap  
- Animations and progress bars while scrapping and selling  
- Configurable prices and locations  
- Integration with **ox_lib**, **ox_target**, and **ox_inventory**  

---

## 🚨 Gameplay

1. **Scrap a Car**  
   - Approach a car → press the interaction key → start scrapping  
   - Progress bar and animation display collection  
   - Random scrap items are added to your inventory  

2. **Sell Scrap**  
   - Go to Scrap Yard NPC → open interaction menu  
   - Sell individual items or all scrap at once  
   - Receive cash for sold scrap  

3. **Dynamic Loot**  
   - Scrap yields random amounts within the configured min/max ranges for each type:  
     ```
     ['steel'] = { min = 3, max = 8, price = 15 },
     ['rubber'] = { min = 2, max = 5, price = 10 },
     ['metalscrap'] = { min = 5, max = 12, price = 12 },
     ['iron'] = { min = 3, max = 7, price = 14 },
     ['copper'] = { min = 2, max = 6, price = 20 },
     ['aluminum'] = { min = 3, max = 9, price = 18 },
     ['plastic'] = { min = 2, max = 6, price = 8 }
     ```

---

## 📍 Default Locations

- **Scrap Buyer NPC:**  
```
2340.59, 3053.88, 48.15, 90.0
```

> Cars can be scrapped **anywhere**, no fixed collection points required.

---

## 🧍 NPC Setup

- NPC model: `s_m_y_dockwork_01`  
- Idle hands-up animation  
- Interaction using **ox_target**  
- Opens scrap selling menu when approached  

---

## 📋 Requirements

- **ox_lib**  
- **ox_target**  
- **ox_inventory**  

> Ensure these start **before this script** in `server.cfg`.

---

## 📁 Installation

1. Place the script folder in your **resources** folder.  
2. Add to `server.cfg`:

```
ensure deanos-scrapyard
```

3. Restart the server.  

---

## 🔧 Customization

- Edit **config.lua** to change:  
  - Scrap item types and prices  
  - NPC location  
  - Progress bar times and animations  
  - Add/remove scrap items if desired  

---

## 🧪 Example Gameplay Flow

**Player:**  
- Approaches a car → scrapping animation → random scrap added to inventory → goes to NPC → sells scrap → receives cash  

**NPC:**  
- Opens sell menu → accepts scrap → player receives cash → confirmation notification  

---

## 💰 Example Earnings

- Selling a mix of scrap items:  
  ```
  5 Steel → $75
  3 Rubber → $30
  7 Metal Scrap → $84
  ```
- Total: $189
