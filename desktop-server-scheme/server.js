const http=require('http'),
fs=require("fs"),
path=require("path"),
url=require('url');

var includes=JSON.parse(
  fs.readFileSync(
    path.resolve(
      __dirname,
      "./files.json"
    )
  )
);
startServer();
function startServer(){
  http.createServer(function (req, res){
    var selected=null;
    var pathname=url.parse(req.url, true).pathname;
    if(pathname=="/"){
      pathname="/index.html";
    }
    for(var i in includes){
      if(includes[i].servepath==pathname){
        selected=includes[i];
        break;
      }
    }
    if(selected==null){
      res.writeHead(404,{'Content-Type':'text/plain'});
      res.end('NOT FOUND \n');
    }else{
      res.writeHead(200,{'Content-Type':selected.mime});
      var data=fs.readFileSync(selected.realpath);
      if(selected.binary){
        res.end(data, 'binary');
      }else{
        res.end(data);
      }
    }
  }).listen(9999);
}
