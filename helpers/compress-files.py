import os
import json
common_dir_separator="/"
if "\\" in os.getcwd():
    common_dir_separator="\\"

def scanProject(current_dir=os.getcwd()):
    output=[]
    for r, d, f in os.walk(current_dir):
        for file in f:
            output.append(current_dir+common_dir_separator+file)
        for directory in d:
            output.extend(scanProject(current_dir+common_dir_separator+directory))
    return output

def morfFilepathToconfig(fullpath, beginepath):
    path=fullpath[len(beginepath):]
    ext=path.split(".")[-1]
    output={}
    if ext=="js":
        output["mime"]="application/javascript"
        output["binary"]=False
    elif ext=="html":
        output["mime"]="text/html"
        output["binary"]=False
    elif ext=="css":
        output["mime"]="text/css"
        output["binary"]=False
    elif ext=="txt":
        output["mime"]="text/plain"
        output["binary"]=False
    elif ext=="json":
        output["mime"]="application/json"
        output["binary"]=False
    elif ext=="png":
        output["mime"]="image/png"
        output["binary"]=True
    elif ext=="mp3":
        output["mime"]="audio/mpeg"
        output["binary"]=True
    else:
        output["mime"]="application/octet-stream"
        output["binary"]=True
    output["realpath"]="."+fullpath
    output["servepath"]=path
    return output

def writeOutCnfgFile(data):
    f = open("../desktop-server-scheme"+common_dir_separator+"files.json", "w")
    f.write(json.dumps(data, sort_keys=True, indent=4))
    f.close()

project_dir="../construct-build"
filelist=scanProject(project_dir)
config=[]
for filepath in filelist:
    config.append(morfFilepathToconfig(filepath, project_dir))

writeOutCnfgFile(config)
