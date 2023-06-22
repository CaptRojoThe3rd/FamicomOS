@echo off

set name="FamicomOS"

set path=%path%;..\bin\
set CC65_HOME=..\

c:\cc65\bin\ca65 main.s --cpu 6502x

c:\cc65\bin\ld65 -C config\layout.cfg -o "%name%.nes" main.o

del *.o

move /Y "FamicomOS.nes" build\

"build\%name%.nes"