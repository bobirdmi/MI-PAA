@echo off
set nl=20
set nb=20
set mval=0.5
set weight=100
set cost=250
set kval=1
set d=0

cd ./knapgen

rem maximum cost generator
for /L %%c in (50 50 500) do @(kgen.exe -n %nl% -N %nb% -m %mval% -W %weight% -C %%c -k %kval% -d %d% > knap_%nl%_%mval%_%weight%_%%c_%kval%_%d%.txt) && @(timeout /t 1)

rem maximum weight generator
for /L %%w in (20 20 200) do @(kgen.exe -n %nl% -N %nb% -m %mval% -W %%w -C %cost% -k %kval% -d %d% > knap_%nl%_%mval%_%%w_%cost%_%kval%_%d%.txt) && @(timeout /t 1)

rem proportion of bag weight to overall weight generator
for %%m in (0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9) do @(kgen.exe -n %nl% -N %nb% -m %%m -W %weight% -C %cost% -k %kval% -d %d% > knap_%nl%_%%m_%weight%_%cost%_%kval%_%d%.txt) && @(timeout /t 1)

rem granularity generator
for /L %%k in (1 1 10) do @(kgen.exe -n %nl% -N %nb% -m %mval% -W %weight% -C %cost% -k %%k -d %d% > knap_%nl%_%mval%_%weight%_%cost%_%%k_%d%.txt) && @(timeout /t 1)

cd ..