@echo off
set nl=4
set nb=15
set m=0.5
set w=10
set k=1
set d=0

cd ./knapgen

for /L %%c in (50 50 250) do @(kgen.exe -n %nl% -N %nb% -m %m% -W %w% -C %%c -k %k% -d %d% > knap_%nl%_%m%_%w%_%%c_%k%_%d%.txt) && @(timeout /t 1)

cd ..