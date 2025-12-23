@echo off
chcp 65001 >nul
title NitroGen 游戏AI

echo ============================================
echo           NitroGen 游戏AI 启动器
echo ============================================
echo.

:: 检查模型文件
if not exist "ng.pt" (
    echo [错误] 未找到模型文件 ng.pt
    echo 请先下载模型: huggingface-cli download nvidia/NitroGen ng.pt --local-dir .
    pause
    exit /b 1
)

:: 获取游戏进程名
if "%~1"=="" (
    set /p GAME_PROCESS=请输入游戏进程名 (例如: game.exe): 
) else (
    set GAME_PROCESS=%~1
)

if "%GAME_PROCESS%"=="" (
    echo [错误] 未输入游戏进程名
    pause
    exit /b 1
)

echo.
echo [信息] 游戏进程: %GAME_PROCESS%
echo [信息] 请确保游戏已经启动
echo.

:: 启动服务器（后台）
echo [1/2] 启动推理服务器...
start /b python scripts/serve.py ng.pt

:: 等待服务器启动
timeout /t 5 /nobreak >nul

:: 启动客户端
echo [2/2] 启动游戏AI...
echo.
python scripts/play.py --process "%GAME_PROCESS%"

pause
