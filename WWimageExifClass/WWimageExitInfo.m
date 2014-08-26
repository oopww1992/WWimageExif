//
//  WWimageExitInfo.m
//  WWimageExif
//
//  Created by 王维 on 14-8-22.
//  Copyright (c) 2014年 wangwei. All rights reserved.
//

#import "WWimageExitInfo.h"

@implementation WWimageExitInfo 
@synthesize imageExifDictionary = _imageExifDictionary;
@synthesize imageTiffDictionary = _imageTiffDictionary;
@synthesize imageProperty,imageFileSize,imageFileType;

- (id)initWithURL:(NSURL*)imageUrl
{
    self = [super init];
    if (self) {
        imageRef = CGImageSourceCreateWithURL((__bridge CFURLRef)imageUrl, NULL);
        imageProperty = (__bridge NSDictionary*)CGImageSourceCopyPropertiesAtIndex(imageRef, 0, NULL);
        imageFileSize = [self fileSize];
        imageFileType = [self fileType];
        
        self.imageExifDictionary = [self imageExifDictionaryGet];
        self.imageTiffDictionary = [self imageTiffDictionary];
    }
    return self;
}

-(NSDictionary *)imageExifDictionaryGet{
    return [imageProperty valueForKey:(NSString*)kCGImagePropertyExifDictionary];
}
- (NSDictionary*)tiffDictonary{
    return [imageProperty valueForKey:(NSString*)kCGImagePropertyTIFFDictionary];
}
- (NSInteger)fileSize
{
    CFDictionaryRef dict = CGImageSourceCopyProperties(imageRef, NULL);
    CFNumberRef fileSize = (CFNumberRef)CFDictionaryGetValue(dict, kCGImagePropertyFileSize);
    CFNumberType type = CFNumberGetType(fileSize);
    int size = 0;
    if (type == kCFNumberSInt32Type) {
        CFNumberGetValue(fileSize, type, &size);
    }
    CFRelease(dict);
    return 0;
}

- (NSString*)fileType
{
    CFStringRef fileDp = CGImageSourceGetType(imageRef);
    CFStringRef fileType = CFCopyDescription(fileDp);
    NSString *typeRef = (__bridge NSString*)fileType;
    CFRelease(fileType);
    return typeRef;
}


@end
