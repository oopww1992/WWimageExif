//
//  AppDelegate.m
//  WWimageExif
//
//  Created by 王维 on 14-8-22.
//  Copyright (c) 2014年 wangwei. All rights reserved.
//

#import "AppDelegate.h"
#import "WWimageExitInfo.h"

@implementation AppDelegate
{
    UIImageView * img;
    UILabel     * label;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100,10, 100, 50)];
    
    [btn setTitle:@"加载图片" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(getImage) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [self.window addSubview:btn];
    
    
    img = [[UIImageView alloc]initWithFrame:CGRectMake(0,60,120 ,200)];
    [self.window addSubview:img];
    
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(120,60,200,480)];
    [label setNumberOfLines:0];
    [label setFont:[UIFont systemFontOfSize:12]];
    [self.window addSubview:label];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)getImage{
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"IMG_0176" withExtension:@"jpg"];
    
    
    [img setImage:[UIImage imageNamed:@"IMG_0176.jpg"]];
    
    
    //初始化后  即可使用各项信息
    WWimageExitInfo * imageInfo = [[WWimageExitInfo alloc]initWithURL:fileUrl];
    
    NSLog(@"imageExifMessage --%@",imageInfo.imageExifDictionary);
    NSLog(@"imageTiffMessage --%@",imageInfo.imageTiffDictionary);
    
    //照片所有信息
    NSLog(@"allImageInfo --%@",imageInfo.imageProperty);
    
    NSLog(@"fileSize --%d",imageInfo.imageFileSize);
    NSLog(@"fileType --%@",imageInfo.imageFileType);
    
    
    
    
    [label setText:[NSString stringWithFormat:@"%@",imageInfo.imageProperty]];

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
