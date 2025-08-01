# **VMware Auto-Configurator**  
### *(Configuratore automatico per VMware Workstation/Player)*  

Un tool **Batch** per Windows che automatizza:  
✅ **Ricerca e configurazione** di VMware Workstation/Player  
✅ **Scansione di tutte le VM** (.vmx) nel sistema  
✅ **Generazione di uno script** per l'avvio automatico delle VM all'accensione del PC  
✅ **Supporto multilingua** (Italiano/Inglese)  

---

## **📖 Descrizione Tecnica (IT/EN)**  

### **🇮🇹 Italiano**  
Questo script **BAT** esegue le seguenti operazioni in modo automatizzato:  

1. **🔍 Rilevamento di VMware**  
   - Cerca `vmrun.exe` nei percorsi standard (`C:\Program Files\VMware...`).  
   - Se non trovato, esegue una scansione approfondita su **tutti i dischi**.  
   - Permette di scaricare VMware Workstation Pro (v17.6.4) da Archive.org se non installato.  

2. **🖥️ Ricerca delle VM**  
   - Scansiona cartelle comuni (`Documents\Virtual Machines`, dischi con `/VM`, `/VMs`, ecc.).  
   - Supporta una **ricerca globale** (include anche unità esterne).  

3. **⚙️ Configurazione dell'avvio automatico**  
   - Genera uno script (`VMware_AutoStart.bat`) che:  
     - Avvia **l'interfaccia grafica di VMware** (`vmware.exe`).  
     - Avvia **le VM selezionate** tramite `vmrun`.  
   - Lo installa nella cartella **Startup di Windows** per l'esecuzione automatica all'avvio.  

4. **🌍 Supporto multilingua**  
   - Interfaccia disponibile in **italiano** e **inglese**.  

---

### **🇬🇧 English**  
This **BAT script** automates:  

1. **🔍 VMware Detection**  
   - Searches for `vmrun.exe` in standard paths (`C:\Program Files\VMware...`).  
   - If not found, performs a **deep scan** across all drives.  
   - Allows downloading VMware Workstation Pro (v17.6.4) from Archive.org if missing.  

2. **🖥️ VM Discovery**  
   - Scans common folders (`Documents\Virtual Machines`, `/VM`, `/VMs`, etc.).  
   - Supports **global search** (including external drives).  

3. **⚙️ Auto-Startup Setup**  
   - Generates a script (`VMware_AutoStart.bat`) that:  
     - Launches **VMware GUI** (`vmware.exe`).  
     - Starts **selected VMs** via `vmrun`.  
   - Installs it in **Windows Startup** for automatic execution.  

4. **🌍 Multi-Language Support**  
   - Available in **Italian** and **English**.  

---

## **🎯 Tutorial / Guida all'uso**  

### **🇮🇹 (Italiano)**  
#### **1. Esecuzione**  
- **Scarica** lo script e aprilo come **Amministratore**.  
- Seleziona la lingua (1=Italiano, 2=Inglese).  

#### **2. Configurazione**  
- Se VMware non è rilevato, puoi:  
  - **Scaricarlo automaticamente** (opzione 1).  
  - **Inserire manualmente** il percorso di `vmrun.exe` (opzione 2).  

#### **3. Selezione delle VM**  
- Scegli le VM da avviare automaticamente:  
  - `all` → Seleziona tutte.  
  - `1 3 5` → Seleziona VM specifiche.  

#### **4. Installazione**  
- Conferma l'installazione nella cartella **Startup**.  
- Al prossimo riavvio, le VM partiranno **in automatico!**  

---

### **🇬🇧 (English)**  
#### **1. How to Run**  
- **Download** the script and run it as **Administrator**.  
- Choose your language (1=Italian, 2=English).  

#### **2. Setup**  
- If VMware is not detected, you can:  
  - **Download it automatically** (option 1).  
  - **Manually enter** the path to `vmrun.exe` (option 2).  

#### **3. VM Selection**  
- Select VMs for auto-start:  
  - `all` → Choose all.  
  - `1 3 5` → Pick specific VMs.  

#### **4. Installation**  
- Confirm installation in the **Startup folder**.  
- On next reboot, VMs will launch **automatically!**  

---

## **📥 Download & GitHub**  
🔗 **[Scarica l'ultima versione](https://github.com/tuorepo/VMware-Auto-Configurator)**  

```bash
git clone https://github.com/tuorepo/VMware-Auto-Configurator.git
```

---

## **🛠️ Requisiti**  
- **VMware Workstation/Player** (se già installato).  
- **Connessione Internet** (solo per il download automatico).  

---

## **📜 License**  
⚖️ **MIT License** - Libero uso, modifica e distribuzione.  

--- 

**🌟 Se ti è utile, lascia una ⭐ su GitHub!** 😊
