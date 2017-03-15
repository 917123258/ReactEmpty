#!/bin/sh
#       last update time: 2017.3.13  马永州 QQ:917123258

# NPM 镜像源

REGISTRY_PATH="https://registry.npm.taobao.org"
DISTURL_PATH="https://npm.taobao.org/dist"

# Homebrew 安装/卸载 地址

BREW_INSTALL_PATH="$(curl --insecure -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
BREW_UNINSTALL_PATH="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

#Homebrew 安装/卸载

function brew_install(){
    ruby -e $BREW_INSTALL_PATH
}

function brew_uninstall(){
    ruby -e $BREW_UNINSTALL_PATH
}

#Node 安装

node_install(){
    node -v>/dev/null
    #判断是否安装node
    if [ $? -eq 0 ];then
        #sudo chown -R $(whoami):admin /usr/local
        sudo chmod go-w /usr/local/bin
        brew upgrade && brew update
    else
        sudo chmod go-w /usr/local/bin
        brew install node
        echo "node框架安装成功!"
    fi
}
# MK 目录
redux_install(){
	npm config set registry $REGISTRY_PATH
	npm config set disturl $DISTURL_PATH
	if [ $? -eq 0 ];then
    	    echo "npm仓库源成功"
	else
 	       	echo "npm仓库源源失败"
	fi
    mkdir actions constants components layouts reducers stores tests views
    touch server.js index.js webpack.config.js
    npm init
    npm install --save koa koa-handlebars koa-router react react-dom react-redux classnames redux
    npm install --save-dev webpack webpack-dev-server webpack-hot-middleware babel-core babel-loader babel-plugin-react-transform style-loader less-loader css-loader extract-text-webpack-plugin babel-preset-es2015 babel-preset-react less
}
#start
start(){
#	node_install
	redux_install
}
start
