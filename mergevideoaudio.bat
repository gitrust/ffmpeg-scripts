@echo off

::
:: Skript zum Video mit Audio zusammenfuehren
:: Argument 1: Video
:: Argument 2: Audio 

:: Pfad zu ffmpeg
set FFMPEG=ffmpeg\bin\ffmpeg.exe

:: wenn Videodatei bereits Audio enthaelt
:: ansonsten auskommentieren
set MAPOPTIONS=-map 0:v -map 1:a

:: Ausgabe Videodatei
set OUTPUT=ausgabe.mp4

:: Konvertierung
%FFMPEG% -i %1 -i %2 %MAPOPTIONS% -codec copy -shortest %OUTPUT%