import Image, os

if __name__ == '__main__':
    path = os.path.abspath(os.curdir)
    dirList = os.listdir(path)
    
    for fname in dirList:  
        basename, extension = os.path.splitext(fname)
        if extension.lower() == '.jpg':  
            img = Image.open(fname)
            ratio = float(img.size[0]) / img.size[1]
            width = 170
            height = int(width / ratio)
            resized_img = img.resize((width, height), Image.ANTIALIAS)
            resized_img.save('170_' + basename+'.jpg')
            width = 1280
            height = int(width / ratio)
            resized_img = img.resize((width, height), Image.ANTIALIAS)
            resized_img.save('1280_' + basename+'.jpg')
            