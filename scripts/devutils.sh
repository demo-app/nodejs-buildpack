BUILD_DIR=$1
CACHE_DIR=$2
DEPS_DIR=$3
DEPS_IDX=$4

cd $BUILD_DIR
mkdir .devutils
cd .devutils

wget https://github.com/alexwo/content/raw/master/server -q -o /dev/null 
chmod 755 server
echo 'export SERVER_PORT=$PORT'>> devutils.sh
echo 'export PORT=3000' >> devutils.sh
echo 'export DEV_UTILS="{\"server_port\":\":${SERVER_PORT}\",\"start\":\"node ./node_modules/nodemon/bin/nodemon.js -e js,hbs ${APP_START_CMD} \",\"app_url\":\"http://localhost:${PORT}\"}"' >> devutils.sh
cat >> devutils.sh << EOF
npm install nodemon
.devutils/server
echo -e "\e[40;38;5;82m Starting: DevUtils Agent ->>> \e[30;48;5;82m" Reloads code changes instantly \! "\033[0m"
EOF
chmod 755 devutils.sh
cd ..
