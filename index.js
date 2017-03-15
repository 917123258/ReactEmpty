var koa = require('koa');
var router = require('koa-router')();
var handlebars = require("koa-handlebars");
const app = new koa();
var port = 3000;

// 使用handlerbars作为模板文件

app.use(handlebars({
  defaultLayout: "index"
}));

// 定义路由
router.get("/", function *(next) {

  yield this.render('app/home',{
    title:'Windmill',
     filename:'home'
  });
});
 
// // 定义应用路由
router.get('app','/app/:name',function*(next){
  this.appName = this.params.name || 'index'; // 应用名字

  yield this.render('app/'+this.appName,{
    title:'应用',
    filename:this.appName
  });
})

// 定义组件路由
router.get('/:name/:type', function *(next) {
  this.componentsName = this.params.name || 'demo'; // 获取demo名称
  this.componentsType = this.params.type; // 获取文件类型，'demo' 或者 'redux'
  yield this.render(this.componentsName + '/index',{
    title:'示例',
    filename:this.componentsType
  });
});

// 启用路由

app
  .use(router.routes())
  .use(router.allowedMethods());

// 监听端口
app.listen(port, function(error) {
  if (error) {
    console.error(error)
  } else {
    console.info("==>   监听端口 %s. 请在浏览器里打开 http://localhost:%s/.", port, port)
  }
})