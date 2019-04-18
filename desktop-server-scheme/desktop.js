const electron=require('electron'),
  {app,BrowserWindow}=electron

let win
app.on('ready', () => {
  openWindow();
})
function openWindow(){
  const {width,height}=electron.screen.getPrimaryDisplay().workAreaSize
  win=new BrowserWindow({
    width,
    height,
    fullscreen:true,
    frame:false
  })
  win.on('closed', () => {
    win=null
  })
  win.loadURL('http://127.0.0.1:9999/')
}
