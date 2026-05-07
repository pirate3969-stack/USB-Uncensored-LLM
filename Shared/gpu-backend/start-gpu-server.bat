@echo off
cd /d "%~dp0"

echo(
echo   GGGG PPPP  U   U      BBBB   AAA   CCCC K   K EEEE N   N DDDD       BBBB   OOO   OOO  TTTTT
echo  G     P   P U   U      B   B A   A C     K  K  E    NN  N D   D      B   B O   O O   O   T  
echo  G  GG PPPP  U   U      BBBB  AAAAA C     KKK   EEE  N N N D   D      BBBB  O   O O   O   T  
echo  G   G P     U   U      B   B A   A C     K  K  E    N  NN D   D      B   B O   O O   O   T  
echo   GGG  P      UUU       BBBB  A   A  CCCC K   K EEEE N   N DDDD       BBBB   OOO   OOO    T  
echo(
echo     A M D  H I P  A C C E L E R A T I O N  -  L O C A L  -  O F F L I N E  -  P R I V A T E  
echo(
echo           C R E A T E D  B Y  TECHJARVES  +  M O D I F I E D  B Y  PIRATE3969
echo(
echo      >> Initialising GPU backend...
echo      >> Loading model into VRAM...
echo      >> Starting llama.cpp HIP server...
echo(
timeout /t 3 >nul

:: -------------------------
:: MODEL SELECTION MENU
:: -------------------------

set MODEL_DIR=J:\USB-Uncensored-LLM\Shared\models

echo Select a model to load:
echo(
echo 1. Gemma 4-E4B Ultra Uncensored
echo 2. Qwen 3.5 9B Aggressive
echo 3. 
echo(

set /p choice="Enter choice (1-3): "

if "%choice%"=="1" set MODEL=%MODEL_DIR%\gemma-4-e4b-it-ultra-uncensored-heretic-q4_k_m.gguf
if "%choice%"=="2" set MODEL=%MODEL_DIR%\qwen3.5-9b-uncensored-hauhaucs-aggressive-q4_k_m.gguf
if "%choice%"=="3" set MODEL=%MODEL_DIR%\

if not defined MODEL (
    echo Invalid selection.
    pause
    exit /b
)

echo(
echo >> Launching model:
echo %MODEL%
echo(

:: -------------------------
:: START GPU SERVER
:: -------------------------

llama-server.exe -m "%MODEL%" -ngl 99 --port 8080
