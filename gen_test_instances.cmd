@echo off
set nl=20
set nb=20
set m=0.5
set w=100
set c=250
set k=1
set d=0

cd ./knapgen

rem maximum cost generator
for /L %%cost in (50 50 500) do @(kgen.exe -n %nl% -N %nb% -m %m% -W %w% -C %%cost -k %k% -d %d% > knap_%nl%_%m%_%w%_%%cost_%k%_%d%.txt) && @(timeout /t 1)

rem maximum weight generator
for /L %%weight in (20 20 200) do @(kgen.exe -n %nl% -N %nb% -m %m% -W %%weight -C %c% -k %k% -d %d% > knap_%nl%_%m%_%%weight_%c%_%k%_%d%.txt) && @(timeout /t 1)

rem proportion of bag weight to overall weight
for /L %%miter in (0.1 0.1 0.9) do @(kgen.exe -n %nl% -N %nb% -m %%miter -W %w% -C %c% -k %k% -d %d% > knap_%nl%_%%miter_%w%_%c%_%k%_%d%.txt) && @(timeout /t 1)

cd ..