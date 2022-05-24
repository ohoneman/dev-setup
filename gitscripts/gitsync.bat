@echo off
@echo execute folder %1
pushd %1
@echo cmd /c ""C:\Program Files\Git\usr\bin\bash.exe" --login -i -- gitsync.sh"
cmd /c ""C:\Program Files\Git\usr\bin\bash.exe" --login -i -- gitsync.sh"
popd