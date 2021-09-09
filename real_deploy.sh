echo 
cd 
export CIRCLE_PROJECT_REPONAME=
pwd
git pull

mkdir -p ../conf.d
pwd
CONF_FILE='ls ./*.conf'
echo $CONF_FILE
for CONF in CONF_FILE
do
    mv $CONF ../conf.d
done
ls

mkdir -p ../docker-compose
envsubst < docker-compose-template.yml > docker-compose-.yml
cp docker-compose-.yml ../docker-compose
ls

cd ../docker-compose
pwd
FILENAME='ls ./*.yml'
echo $FILENAME
FILE='docker-compose'
for EACHFILE in FILENAME
do
    FILE+=' -f $EACHFILE'
done
FILE+=' up -d'
echo FILE

echo $FILE
echo $FILE > run.sh
sh run.sh
