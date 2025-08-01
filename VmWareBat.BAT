@echo off
setlocal enabledelayedexpansion
color 07
:: Avvio come amministratore
whoami /groups | find "S-1-5-32-544" >nul
if not errorlevel 1 goto :admin_ok
:: Rilancia come admin
powershell -Command "Start-Process '%~f0' -Verb RunAs" >nul 2>&1
exit /b
:admin_ok

:: Selettore lingua
set "lang=it"
echo.
echo =================================================================
echo           Seleziona la lingua / Select language
echo =================================================================
echo.
echo   [1] Italiano
echo   [2] English
echo.
set /p "lang_choice=Scegli la lingua / Choose language (1-2): "
if "%lang_choice%"=="2" set "lang=en"
echo.

:: Messaggi multilingua
if "%lang%"=="it" (
    set "msg_title=VMWARE AUTO-CONFIGURATOR"
    set "msg_subtitle=Versione Completa con Download VMware"
    set "msg_disks=Rilevazione dischi disponibili..."
    set "msg_total_disks=Totale dischi rilevati:"
    set "msg_search_vmware=Ricerca VMware (scansione approfondita)..."
    set "msg_standard_paths=Controllo percorsi standard..."
    set "msg_found=+ VMware trovato:"
    set "msg_not_found=VMware non trovato nei percorsi standard."
    set "msg_deep_search=Avvio ricerca approfondita su tutti i dischi..."
    set "msg_minutes=Questa operazione puo richiedere alcuni minuti"
    set "msg_scan_disk=Scansione approfondita disco:"
    set "msg_vmware_not_found=VMware non trovato nel sistema!"
    set "msg_options=Opzioni disponibili:"
    set "msg_option1=[1] Scaricare VMware Workstation Pro 17.6.4 (link diretto da Archive.org)"
    set "msg_option2=[2] Inserire manualmente il percorso di vmrun.exe"
    set "msg_option3=[3] Annullare"
    set "msg_choose_option=Scegli opzione (1-3): "
    set "msg_download_vmware=Download VMware Workstation Pro 17.6.4..."
    set "msg_download_info=- Prodotto: VMware Workstation Pro 17.6.4 (versione completa)"
    set "msg_download_source=- Fonte: Archive.org (affidabile)"
    set "msg_download_size=- Dimensione: circa 600MB"
    set "msg_download_license=- Licenza: Richiede attivazione (trial o licenza)"
    set "msg_confirm_dl=Confermi download e apertura browser? (s/n): "
    set "msg_open_browser=Apro il browser per il download diretto..."
    set "msg_manual_path=Inserisci manualmente il percorso completo di vmrun.exe:"
    set "msg_example=(Esempio: C:\Program Files\VMware\VMware Workstation\vmrun.exe)"
    set "msg_invalid_path=Percorso non valido o file non trovato!"
    set "msg_manual_config=+ VMware configurato manualmente:"
    set "msg_cancelled=Operazione annullata dall'utente."
    set "msg_vmware_config=VMware configurato:"
    set "msg_vmrun_exec=Eseguibile vmrun:"
    set "msg_phase3=[FASE 3] Ricerca VM (scansione completa sistema)..."
    set "msg_gen_list=Generazione lista cartelle di ricerca..."
    set "msg_scan_folders=Scansione cartelle specifiche..."
    set "msg_folders_to_scan=Cartelle da scansionare:"
    set "msg_no_vm=Nessuna VM trovata nelle cartelle standard."
    set "msg_global_search=Avvio ricerca globale approfondita..."
    set "msg_global_search_time=(Questa operazione puo richiedere diversi minuti)"
    set "msg_global_disk=Ricerca globale su disco:"
    set "msg_global_found=(ricerca globale)"
    set "msg_no_vm_system=Nessuna VM trovata nel sistema!"
    set "msg_tips=Suggerimenti:"
    set "msg_tip1=- Assicurati di avere VM create in VMware"
    set "msg_tip2=- Controlla che i file .vmx esistano"
    set "msg_tip3=- Prova a eseguire come amministratore"
    set "msg_create_sample=Vuoi che mostri come creare una VM di esempio? (s/n): "
    set "msg_how_create=Come creare una VM in VMware:"
    set "msg_how1=1. Apri VMware Workstation"
    set "msg_how2=2. File > New Virtual Machine"
    set "msg_how3=3. Segui la procedura guidata"
    set "msg_how4=4. Riavvia questo script"
    set "msg_total_vm=+ Trovate %vm_count% VM totali nel sistema"
    set "msg_phase4=[FASE 4] Selezione VM per startup automatico..."
    set "msg_one_vm=Una sola VM disponibile:"
    set "msg_path=Percorso:"
    set "msg_auto_select=Configurare questa VM per avvio automatico? (s/n): "
    set "msg_cancelled2=Operazione annullata."
    set "msg_vm_list=VM disponibili nel sistema:"
    set "msg_select_vm=Selezione VM per avvio automatico:"
    set "msg_select_hint=- Inserisci i numeri separati da spazio (es: 1 3 5)"
    set "msg_select_all=- Oppure 'all' per selezionare tutte"
    set "msg_select_none=- Oppure 'none' per annullare"
    set "msg_choice=La tua scelta: "
    set "msg_error_num=Errore: numero non valido"
    set "msg_error_max=Errore: numero non valido (max: %vm_count%)"
    set "msg_all_selected=+ Tutte le VM selezionate."
    set "msg_phase5=[FASE 5] Generazione script di avvio automatico..."
    set "msg_script_gen=+ Script di avvio generato:"
    set "msg_vm_selected=VM selezionate per avvio automatico:"
    set "msg_phase6=[FASE 6] Installazione nella cartella di avvio automatico..."
    set "msg_startup_folder=Cartella di avvio automatico:"
    set "msg_script_name=Lo script verra installato come: VMware_AutoStart.bat"
    set "msg_script_info=Le VM selezionate si avvieranno automaticamente ad ogni avvio di Windows."
    set "msg_confirm_install=Confermi l'installazione? (s/n): "
    set "msg_install_success=+ Script installato con successo!"
    set "msg_install_path=+ Percorso:"
    set "msg_backup=+ Backup creato in:"
    set "msg_install_error=- Errore durante l'installazione automatica!"
    set "msg_manual_install=Installazione manuale richiesta:"
    set "msg_manual1=1. Copia il file:"
    set "msg_manual2=2. Incolla nella cartella:"
    set "msg_manual3=3. Rinomina in: VMware_AutoStart.bat"
    set "msg_install_cancelled=Installazione annullata."
    set "msg_script_available=Script disponibile in:"
    set "msg_test_now=Vuoi testare lo script di avvio adesso? (s/n): "
    set "msg_test_start=INIZIO TEST"
    set "msg_test_end=FINE TEST"
    set "msg_config_done=CONFIGURAZIONE COMPLETATA"
    set "msg_summary=Riepilogo configurazione:"
    set "msg_disks_scanned=- Dischi scansionati:"
    set "msg_vmware_installed=- VMware installato:"
    set "msg_vm_total=- VM totali trovate:"
    set "msg_vm_selected_count=- VM selezionate per avvio automatico:"
    set "msg_install_ok=- Installazione: COMPLETATA CON SUCCESSO"
    set "msg_install_next=- Al prossimo riavvio le VM si avvieranno automaticamente"
    set "msg_install_fail=- Installazione: NON COMPLETATA"
    set "msg_install_manual=- Installa manualmente per attivare l'avvio automatico"
    set "msg_thanks=Grazie per aver utilizzato VMware Auto-Configurator!"
) else (
    set "msg_title=VMWARE AUTO-CONFIGURATOR"
    set "msg_subtitle=Full Version with VMware Download"
    set "msg_disks=Detecting available disks..."
    set "msg_total_disks=Total disks detected:"
    set "msg_search_vmware=Searching for VMware (deep scan)..."
    set "msg_standard_paths=Checking standard paths..."
    set "msg_found=+ VMware found:"
    set "msg_not_found=VMware not found in standard paths."
    set "msg_deep_search=Starting deep search on all disks..."
    set "msg_minutes=This operation may take several minutes"
    set "msg_scan_disk=Deep scan disk:"
    set "msg_vmware_not_found=VMware not found on the system!"
    set "msg_options=Available options:"
    set "msg_option1=[1] Download VMware Workstation Pro 17.6.4 (direct link from Archive.org)"
    set "msg_option2=[2] Enter vmrun.exe path manually"
    set "msg_option3=[3] Cancel"
    set "msg_choose_option=Choose option (1-3): "
    set "msg_download_vmware=Download VMware Workstation Pro 17.6.4..."
    set "msg_download_info=- Product: VMware Workstation Pro 17.6.4 (full version)"
    set "msg_download_source=- Source: Archive.org (trusted)"
    set "msg_download_size=- Size: about 600MB"
    set "msg_download_license=- License: Requires activation (trial or license)"
    set "msg_confirm_dl=Confirm download and open browser? (y/n): "
    set "msg_open_browser=Opening browser for direct download..."
    set "msg_manual_path=Enter the full path to vmrun.exe manually:"
    set "msg_example=(Example: C:\Program Files\VMware\VMware Workstation\vmrun.exe)"
    set "msg_invalid_path=Invalid path or file not found!"
    set "msg_manual_config=+ VMware manually configured:"
    set "msg_cancelled=Operation cancelled by user."
    set "msg_vmware_config=VMware configured:"
    set "msg_vmrun_exec=vmrun executable:"
    set "msg_phase3=[STEP 3] VM search (full system scan)..."
    set "msg_gen_list=Generating search folder list..."
    set "msg_scan_folders=Scanning specific folders..."
    set "msg_folders_to_scan=Folders to scan:"
    set "msg_no_vm=No VM found in standard folders."
    set "msg_global_search=Starting global deep search..."
    set "msg_global_search_time=(This operation may take several minutes)"
    set "msg_global_disk=Global search on disk:"
    set "msg_global_found=(global search)"
    set "msg_no_vm_system=No VM found on the system!"
    set "msg_tips=Tips:"
    set "msg_tip1=- Make sure you have VMs created in VMware"
    set "msg_tip2=- Check that .vmx files exist"
    set "msg_tip3=- Try running as administrator"
    set "msg_create_sample=Do you want to see how to create a sample VM? (y/n): "
    set "msg_how_create=How to create a VM in VMware:"
    set "msg_how1=1. Open VMware Workstation"
    set "msg_how2=2. File > New Virtual Machine"
    set "msg_how3=3. Follow the wizard"
    set "msg_how4=4. Restart this script"
    set "msg_total_vm=+ Found %vm_count% total VMs on the system"
    set "msg_phase4=[STEP 4] Select VM for auto startup..."
    set "msg_one_vm=Only one VM available:"
    set "msg_path=Path:"
    set "msg_auto_select=Configure this VM for auto startup? (y/n): "
    set "msg_cancelled2=Operation cancelled."
    set "msg_vm_list=VMs available on the system:"
    set "msg_select_vm=Select VM for auto startup:"
    set "msg_select_hint=- Enter numbers separated by space (e.g. 1 3 5)"
    set "msg_select_all=- Or 'all' to select all"
    set "msg_select_none=- Or 'none' to cancel"
    set "msg_choice=Your choice: "
    set "msg_error_num=Error: invalid number"
    set "msg_error_max=Error: invalid number (max: %vm_count%)"
    set "msg_all_selected=+ All VMs selected."
    set "msg_phase5=[STEP 5] Generating auto startup script..."
    set "msg_script_gen=+ Startup script generated:"
    set "msg_vm_selected=VMs selected for auto startup:"
    set "msg_phase6=[STEP 6] Installing in auto startup folder..."
    set "msg_startup_folder=Auto startup folder:"
    set "msg_script_name=The script will be installed as: VMware_AutoStart.bat"
    set "msg_script_info=Selected VMs will start automatically at every Windows startup."
    set "msg_confirm_install=Confirm installation? (y/n): "
    set "msg_install_success=+ Script installed successfully!"
    set "msg_install_path=+ Path:"
    set "msg_backup=+ Backup created in:"
    set "msg_install_error=- Error during automatic installation!"
    set "msg_manual_install=Manual installation required:"
    set "msg_manual1=1. Copy the file:"
    set "msg_manual2=2. Paste in folder:"
    set "msg_manual3=3. Rename to: VMware_AutoStart.bat"
    set "msg_install_cancelled=Installation cancelled."
    set "msg_script_available=Script available at:"
    set "msg_test_now=Do you want to test the startup script now? (y/n): "
    set "msg_test_start=START TEST"
    set "msg_test_end=END TEST"
    set "msg_config_done=CONFIGURATION COMPLETED"
    set "msg_summary=Configuration summary:"
    set "msg_disks_scanned=- Disks scanned:"
    set "msg_vmware_installed=- VMware installed:"
    set "msg_vm_total=- Total VMs found:"
    set "msg_vm_selected_count=- VMs selected for auto startup:"
    set "msg_install_ok=- Installation: SUCCESSFUL"
    set "msg_install_next=- On next reboot VMs will start automatically"
    set "msg_install_fail=- Installation: NOT COMPLETED"
    set "msg_install_manual=- Install manually to enable auto startup"
    set "msg_thanks=Thank you for using VMware Auto-Configurator!"
)

echo =============================================
echo %msg_title%
echo %msg_subtitle%
echo =============================================
echo.

:: Array per memorizzare le VM trovate
set vm_count=0

echo [%msg_disks%]
echo.
:: Rileva tutti i dischi disponibili
set disk_count=0
for %%d in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%d:\" (
        set "disk[!disk_count!]=%%d:"
        if "%lang%"=="it" (
            echo   + Disco trovato: %%d:\
        ) else (
            echo   + Disk found: %%d:\
        )
        set /a disk_count+=1
    )
)
echo   %msg_total_disks% %disk_count%
echo.

echo [%msg_search_vmware%]
echo.
set "VMWARE_PATH="
set "VMRUN_PATH="

:: Prima cerca nei percorsi standard
echo   %msg_standard_paths%
set "standard_paths[0]=C:\Program Files (x86)\VMware\VMware Workstation"
set "standard_paths[1]=C:\Program Files\VMware\VMware Workstation"
set "standard_paths[2]=C:\Program Files (x86)\VMware\VMware Player"
set "standard_paths[3]=C:\Program Files\VMware\VMware Player"
set "standard_paths[4]=C:\Program Files (x86)\VMware\VMware Workstation Pro"
set "standard_paths[5]=C:\Program Files\VMware\VMware Workstation Pro"

for /l %%i in (0,1,5) do (
    if defined standard_paths[%%i] (
        if exist "!standard_paths[%%i]!\vmrun.exe" (
            set "VMWARE_PATH=!standard_paths[%%i]!"
            set "VMRUN_PATH=!standard_paths[%%i]!\vmrun.exe"
            echo   %msg_found% !VMWARE_PATH!
            goto :vmware_found
        )
    )
)

echo   %msg_not_found%
echo   %msg_deep_search%
echo   (%msg_minutes%)
echo.

for /l %%i in (0,1,%disk_count%) do (
    if defined disk[%%i] (
        echo   %msg_scan_disk% !disk[%%i]!\
        
        :: Cerca vmrun.exe ricorsivamente ma evita cartelle sistema
        for /f "delims=" %%f in ('dir /s /b "!disk[%%i]!\vmrun.exe" 2^>nul ^| findstr /v /i "system32\|syswow64\|temp\|cache\|recycle"') do (
            set "VMRUN_PATH=%%f"
            for %%k in ("%%f") do set "VMWARE_PATH=%%~dpk"
            set "VMWARE_PATH=!VMWARE_PATH:~0,-1!"
            echo     + VMware trovato: !VMWARE_PATH!
            goto :vmware_found
        )
    )
)

:: Se VMware non e stato trovato
echo   %msg_vmware_not_found%
echo.
echo   %msg_options%
echo.
echo   %msg_option1%
echo   %msg_option2%
echo   %msg_option3%
echo.

:vmware_choice
set /p "vmware_option=%msg_choose_option% "
if "%vmware_option%"=="3" goto :exit_script

if "%vmware_option%"=="2" (
    echo.
    echo   %msg_manual_path%
    echo   %msg_example%
    echo.
    set /p "manual_vmrun_path=>> "

    if exist "!manual_vmrun_path!" (
        set "VMRUN_PATH=!manual_vmrun_path!"
        for %%k in ("!manual_vmrun_path!") do set "VMWARE_PATH=%%~dpk"
        set "VMWARE_PATH=!VMWARE_PATH:~0,-1!"
        echo   %msg_manual_config% !VMWARE_PATH!
        goto :vmware_found
    ) else (
        echo   %msg_invalid_path%
        echo.
        goto :vmware_choice
    )
)

if "%vmware_option%"=="1" (
    echo.
    echo   %msg_download_vmware%
    echo   %msg_download_info%
    echo   %msg_download_source%
    echo   %msg_download_size%
    echo   %msg_download_license%
    echo.
    set /p "confirm_dl=%msg_confirm_dl% "
    
    if /i "!confirm_dl!"=="s" (
        echo   %msg_open_browser%
        start "" "https://archive.org/download/vmware-workstation-full-17.6.4-24832109/VMware-workstation-full-17.6.4-24832109.exe"
    )
    if /i "!confirm_dl!"=="y" (
        echo   %msg_open_browser%
        start "" "https://archive.org/download/vmware-workstation-full-17.6.4-24832109/VMware-workstation-full-17.6.4-24832109.exe"
    )
    echo.
    goto :vmware_choice
)

echo   Opzione non valida, riprova.
goto :vmware_choice

:exit_script
echo   %msg_cancelled%
pause
exit /b 0

:vmware_found
echo.
echo   %msg_vmware_config% !VMWARE_PATH!
echo   %msg_vmrun_exec% !VMRUN_PATH!
echo.

:: FASE 3: Ricerca VM
echo %msg_phase3%
echo.

:: Lista di tutte le possibili cartelle VM
echo   %msg_gen_list%

set search_count=0

:: Aggiungi cartelle utente standard
set "vm_search_paths[!search_count!]=%USERPROFILE%\Documents\Virtual Machines"
set /a search_count+=1
set "vm_search_paths[!search_count!]=%USERPROFILE%\VMware"
set /a search_count+=1
set "vm_search_paths[!search_count!]=%PUBLIC%\Documents\Virtual Machines"
set /a search_count+=1
set "vm_search_paths[!search_count!]=%ALLUSERSPROFILE%\VMware"
set /a search_count+=1

:: Per ogni disco, aggiungi cartelle comuni
for /l %%i in (0,1,%disk_count%) do (
    if defined disk[%%i] (
        set "vm_search_paths[!search_count!]=!disk[%%i]!\Virtual Machines"
        set /a search_count+=1
        set "vm_search_paths[!search_count!]=!disk[%%i]!\VMware"
        set /a search_count+=1
        set "vm_search_paths[!search_count!]=!disk[%%i]!\VM"
        set /a search_count+=1
        set "vm_search_paths[!search_count!]=!disk[%%i]!\VMs"
        set /a search_count+=1
        set "vm_search_paths[!search_count!]=!disk[%%i]!\Virtual"
        set /a search_count+=1
    )
)

echo   %msg_folders_to_scan% %search_count%
echo.

:: Scansiona tutte le cartelle specifiche
echo   %msg_scan_folders%
for /l %%i in (0,1,%search_count%) do (
    if defined vm_search_paths[%%i] (
        if exist "!vm_search_paths[%%i]!" (
            echo   - Scansione: !vm_search_paths[%%i]!
            
            for /r "!vm_search_paths[%%i]!" %%f in (*.vmx) do (
                set /a vm_count+=1
                set "vm_path[!vm_count!]=%%f"
                
                :: Estrai nome VM dal nome file
                for %%g in ("%%f") do set "vm_name[!vm_count!]=%%~ng"
                
                echo     [!vm_count!] !vm_name[!vm_count]!
            )
        )
    )
)

:: Se non trovate VM, ricerca globale approfondita
if %vm_count% equ 0 (
    echo.
    echo   %msg_no_vm%
    echo   %msg_global_search%
    echo   %msg_global_search_time%
    echo.
    
    for /l %%i in (0,1,%disk_count%) do (
        if defined disk[%%i] (
            echo   %msg_global_disk% !disk[%%i]!\
            
            :: Ricerca globale ma esclude cartelle sistema e temporanee
            for /f "delims=" %%f in ('dir /s /b "!disk[%%i]!\*.vmx" 2^>nul ^| findstr /v /i "windows\|system32\|program files\|temp\|cache\|recycle\|backup"') do (
                set /a vm_count+=1
                set "vm_path[!vm_count!]=%%f"
                for %%g in ("%%f") do set "vm_name[!vm_count!]=%%~ng"
                echo     [!vm_count!] !vm_name[!vm_count]! %msg_global_found%
            )
        )
    )
)

echo.
if %vm_count% equ 0 (
    echo   %msg_no_vm_system%
    echo.
    echo   %msg_tips%
    echo   %msg_tip1%
    echo   %msg_tip2%
    echo   %msg_tip3%
    echo.
    set /p "create_sample=%msg_create_sample% "
    
    if /i "!create_sample!"=="s" (
        echo.
        echo   %msg_how_create%
        echo   %msg_how1%
        echo   %msg_how2%
        echo   %msg_how3%
        echo   %msg_how4%
        echo.
    )
    if /i "!create_sample!"=="y" (
        echo.
        echo   %msg_how_create%
        echo   %msg_how1%
        echo   %msg_how2%
        echo   %msg_how3%
        echo   %msg_how4%
        echo.
    )
    
    pause
    exit /b 1
)

echo   + Trovate %vm_count% VM totali nel sistema
echo.

:: FASE 4: Selezione VM
echo %msg_phase4%
echo.

if %vm_count% equ 1 (
    echo   %msg_one_vm% !vm_name[1]!
    echo   %msg_path% !vm_path[1]!
    echo.
    set /p "auto_select=%msg_auto_select% "
    
    if /i "!auto_select!"=="s" (
        set "selected_vms= 1"
    ) else if /i "!auto_select!"=="y" (
        set "selected_vms= 1"
    ) else (
        echo   %msg_cancelled2%
        pause
        exit /b 0
    )
) else (
    echo   %msg_vm_list%
    echo.
    for /l %%i in (1,1,%vm_count%) do (
        echo   [%%i] !vm_name[%%i]!
        echo       %msg_path% !vm_path[%%i]!
        echo.
    )
    
    echo   %msg_select_vm%
    echo   %msg_select_hint%
    echo   %msg_select_all%
    echo   %msg_select_none%
    echo.
    
    :vm_selection
    set /p "selection=%msg_choice% "
    
    if /i "%selection%"=="none" (
        echo   %msg_cancelled2%
        pause
        exit /b 0
    )
    
    if /i "%selection%"=="all" (
        set "selected_vms="
        for /l %%i in (1,1,%vm_count%) do (
            set "selected_vms=!selected_vms! %%i"
        )
        echo   %msg_all_selected%
    ) else (
        set "selected_vms= %selection%"
        
        :: Verifica che i numeri siano validi
        for %%s in (%selected_vms%) do (
            if %%s LSS 1 (
                echo   %msg_error_num%
                goto :vm_selection
            )
            if %%s GTR %vm_count% (
                echo   %msg_error_max%
                goto :vm_selection
            )
        )
    )
)

echo.

:: FASE 5: Generazione script
echo %msg_phase5%
echo.

set "startup_script=%TEMP%\VMware_AutoStart.bat"

echo @echo off > "%startup_script%"
echo :: ______________________________________________________________ >> "%startup_script%"
echo :: Script generato da VMware Auto-Configurator >> "%startup_script%"
echo :: Data: %DATE% %TIME% >> "%startup_script%"
echo :: VMware: !VMWARE_PATH! >> "%startup_script%"
echo :: ______________________________________________________________ >> "%startup_script%"
echo. >> "%startup_script%"
echo title VMware Auto Startup >> "%startup_script%"
echo color 0A >> "%startup_script%"
echo. >> "%startup_script%"

:: Aggiungi intestazione multilingua
if "%lang%"=="it" (
    echo echo ______________________________________________________________ >> "%startup_script%"
    echo echo                   AVVIO AUTOMATICO VM VMWARE                   >> "%startup_script%"
    echo echo ______________________________________________________________ >> "%startup_script%"
    echo echo. >> "%startup_script%"
    echo echo [%%TIME%%] Attesa stabilizzazione sistema... >> "%startup_script%"
) else (
    echo echo ______________________________________________________________ >> "%startup_script%"
    echo echo                   VMWARE AUTO STARTUP                          >> "%startup_script%"
    echo echo ______________________________________________________________ >> "%startup_script%"
    echo echo. >> "%startup_script%"
    echo echo [%%TIME%%] Waiting for system stabilization... >> "%startup_script%"
)
echo timeout /t 30 /nobreak ^>nul >> "%startup_script%"
echo. >> "%startup_script%"

:: Avvio VMware + VM (con traduzione)
set current_vm=0
for %%s in (%selected_vms%) do (
    if defined vm_path[%%s] (
        set /a current_vm+=1
        if "%lang%"=="it" (
            echo echo [%%TIME%%] Avvio VM !current_vm!/%selected_vm_count%: !vm_name[%%s]! >> "%startup_script%"
            echo echo     Percorso: !vm_path[%%s]! >> "%startup_script%"
        ) else (
            echo echo [%%TIME%%] Starting VM !current_vm!/%selected_vm_count%: !vm_name[%%s]! >> "%startup_script%"
            echo echo     Path: !vm_path[%%s]! >> "%startup_script%"
        )
        echo "!VMRUN_PATH!" start "!vm_path[%%s]!" >> "%startup_script%"
        echo if %%errorlevel%% equ 0 ^( >> "%startup_script%"
        if "%lang%"=="it" (
            echo     echo [%%TIME%%] + !vm_name[%%s]! avviata con successo >> "%startup_script%"
        ) else (
            echo     echo [%%TIME%%] + !vm_name[%%s]! started successfully >> "%startup_script%"
        )
        echo ^) else ^( >> "%startup_script%"
        if "%lang%"=="it" (
            echo     echo [%%TIME%%] - ERRORE nell'avvio di !vm_name[%%s]! >> "%startup_script%"
        ) else (
            echo     echo [%%TIME%%] - ERROR starting !vm_name[%%s]! >> "%startup_script%"
        )
        echo ^) >> "%startup_script%"
        echo timeout /t 5 /nobreak ^>nul >> "%startup_script%"
        echo. >> "%startup_script%"
    )
)

:: Messaggio finale multilingua
if "%lang%"=="it" (
    echo echo [%%TIME%%] Processo completato. Le VM sono pronte! >> "%startup_script%"
    echo echo ______________________________________________________________ >> "%startup_script%"
    echo echo Configurazione riuscita - Puoi chiudere questa finestra. >> "%startup_script%"
) else (
    echo echo [%%TIME%%] Process completed. VMs are ready! >> "%startup_script%"
    echo echo ______________________________________________________________ >> "%startup_script%"
    echo echo Setup successful - You can close this window. >> "%startup_script%"
)
echo timeout /t 10 /nobreak ^>nul >> "%startup_script%"
echo exit /b 0 >> "%startup_script%"

:: FASE 6: Installazione
echo %msg_phase6%
echo.

:: Ottieni cartella di avvio automatico
for /f "tokens=2*" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Startup 2^>nul') do set "STARTUP_FOLDER=%%b"

if "%STARTUP_FOLDER%"=="" (
    set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
)

echo   %msg_startup_folder% %STARTUP_FOLDER%
echo   %msg_script_name%
echo   %msg_script_info%
echo.

set /p "confirm_install=%msg_confirm_install% "

if /i "%confirm_install%"=="s" goto :install_script
if /i "%confirm_install%"=="y" goto :install_script

echo   %msg_install_cancelled%
echo   %msg_script_available% %startup_script%
echo.
goto :test_script

:install_script
:: Crea backup se esiste gia
set "target_script=%STARTUP_FOLDER%\VMware_AutoStart.bat"
if exist "%target_script%" (
    copy "%target_script%" "%target_script%.backup_%date:~-4%%date:~3,2%%date:~0,2%" >nul 2>&1
)

:: Copia lo script
copy "%startup_script%" "%target_script%" >nul 2>&1

if exist "%target_script%" (
    echo   %msg_install_success%
    echo   %msg_install_path% %target_script%
    if exist "%target_script%.backup*" (
        echo   %msg_backup% %target_script%.backup*
    )
    set "installation_success=1"
    echo.
) else (
    echo   %msg_install_error%
    echo   %msg_manual_install%
    echo   %msg_manual1% %startup_script%
    echo   %msg_manual2% %STARTUP_FOLDER%
    echo   %msg_manual3%
    set "installation_success=0"
    echo.
)

:test_script
set /p "test_now=%msg_test_now% "

if /i "%test_now%"=="s" goto :run_test
if /i "%test_now%"=="y" goto :run_test
goto :final_summary

:run_test
echo.
echo ================================================================
echo %msg_test_start%
echo ================================================================
echo.

if "%installation_success%"=="1" (
    call "%target_script%"
) else (
    call "%startup_script%"
)

echo.
echo ================================================================
echo %msg_test_end%
echo ================================================================
echo.

:final_summary
echo ================================================================
echo %msg_config_done%
echo ================================================================
echo.
echo %msg_summary%
echo %msg_disks_scanned% %disk_count%
echo %msg_vmware_installed% !VMWARE_PATH!
echo %msg_vm_total% %vm_count%
echo %msg_vm_selected_count% %selected_vm_count%

if "%installation_success%"=="1" (
    echo %msg_install_ok%
    echo %msg_install_next%
) else (
    echo %msg_install_fail%
    echo %msg_install_manual%
)

echo.
echo %msg_thanks%
echo.
pause
exit /b 0