#! /bin/bash

set -e
echo 'Initiated deploy...\n'

web_dirs=$(find /home/USER/xcode/MyFrontGiraPrepa/* -maxdepth 0 -type d -printf "%f\n")
web_dirs_preguntas=$(find /home/USER/xcode/MyFrontGiraPrepa/preguntas/* -maxdepth 0 -type d -printf "%f\n")
web_dirs_curso=$(find /home/USER/xcode/MyFrontGiraPrepa/curso/* -maxdepth 0 -type d -printf "%f\n")

echo 'Limpiando MIN dir'
cd /home/USER/xcode/html/
rm -rf $web_dirs

echo 'Creando dirs'
cd /home/USER/xcode/html/
mkdir $web_dirs 2>/dev/null || :
cd /home/USER/xcode/html/preguntas/
mkdir $web_dirs_preguntas 2>/dev/null || :
cd /home/USER/xcode/html/curso/
mkdir $web_dirs_curso 2>/dev/null || :

echo 'Copiando assets\n'
cp -r /home/USER/xcode/MyFrontGiraPrepa/assets/ /home/USER/xcode/html/
cp /home/USER/xcode/MyFrontGiraPrepa/.gitignore /home/USER/xcode/html/.gitignore
cp /home/USER/xcode/MyFrontGiraPrepa/xdeploy.sh /home/USER/xcode/html/xdeploy.sh
cp /home/USER/xcode/MyFrontGiraPrepa/list_files.py /home/USER/xcode/html/list_files.py

echo 'Comprobando dirs'
web_dirs=$(find /home/USER/xcode/MyFrontGiraPrepa/* -type d | wc -l)
min_web_dirs=$(find /home/USER/xcode/html/* -type d | wc -l)
if [ $web_dirs -eq $min_web_dirs ]; then
   echo 'The number of DIRS are correct WEB:' $web_dirs 'MIN_WEB:' $min_web_dirs'.\n'
else
    echo 'ERROR\n The number of DIRS arent equal WEB:' $web_dirs 'MIN_WEB:' $min_web_dirs '.\n Create DIRS and try again.\n'
    exit 1
fi

cd /home/USER/xcode/minWebGIRAPREPA/
pip install -r requirements.txt

sh /home/USER/xcode/minWebGIRAPREPA/min.sh;
echo 'Archivos minimizados\n'

echo 'El commit tendrá el comentario <<'$1'>>, ¡excelente!\n'

echo 'Se sube el cambio a Repositorio Legible :)'
cd /home/USER/xcode/MyFrontGiraPrepa
git pull || :
git add . || :
git commit -m "$1" || :
git push || :
echo '\n'

echo 'Se sube el cambio a Repositorio Minificado :)'
cd /home/USER/xcode/html
git pull || :
git add . || :
git commit -m "$1" || :
git push || :
echo '\n'

echo '¡El cambio se ha sido subido!\n'

echo 'Entrando al VPS :)'
ssh USER@IP -p PORT "sh sh.sh"
