WWimageExif
===========

get image exif info!

#非常简便的获得照片的exif，tiff等信息


#使用一句代码

==================
 //初始化后  即可使用各项信息
    WWimageExitInfo * imageInfo = [[WWimageExitInfo alloc]initWithURL:fileUrl];
    
    NSLog(@"imageExifMessage --%@",imageInfo.imageExifDictionary);
    NSLog(@"imageTiffMessage --%@",imageInfo.imageTiffDictionary);
    
    //照片所有信息
    NSLog(@"allImageInfo --%@",imageInfo.imageProperty);
    
    NSLog(@"fileSize --%d",imageInfo.imageFileSize);
    NSLog(@"fileType --%@",imageInfo.imageFileType);
