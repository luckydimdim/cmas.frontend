**Система CMAS**

Настройка транспиллера SCSS в WebStorm:
1) создать watcher SCSS
2) указать путь к scss, напр. "Programm: d:\Env\ChocolateyTools\ruby23\bin\scss.bat"
3) задать следующие аргументы --no-cache --update $FileName$:$FileNameWithoutExtension$.css -I $ContentRoot$\web
4) указать output path $FileNameWithoutExtension$.css:$FileNameWithoutExtension$.css.map
5) снять чекбок "track only root files"

Сборка для выкладки:
pub build --mode=release -DENVIRONMENT=development 
pub build --mode=release -DENVIRONMENT=production 
pub build --mode=release -DENVIRONMENT=test 