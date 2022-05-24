@echo off
@echo execute folder %1
pushd %1
@echo cmd /c ""C:\Program Files\Git\usr\bin\bash.exe" --login -i -- gitshowbranchall.sh"
cmd /c ""C:\Program Files\Git\usr\bin\bash.exe" --login -i -- gitshowbranchall.sh"
popd

pause