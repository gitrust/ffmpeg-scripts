@echo on
h:\Applications\PortableApps\Floola\Floola\ffmpeg -i %1 -f mp4 -r 25 -s 320×240 -b 768000 -ac 2 -ar 44000 -vol 400 -ab 112000 c:\temp\%2.mp4
