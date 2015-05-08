//
//  MADWebPManager.m
//  WebPDemo
//
//  Created by Michael Davidson on 5/7/15.
//  Copyright (c) 2015 Michael Davidson. All rights reserved.
//

#import "MADWebPManager.h"
#import "WebP/UIImage+WebP.h"

@interface MADWebPManager()

@property (strong, nonatomic)NSMutableArray *webPData;

@end

@implementation MADWebPManager

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _webPFiles = [[NSMutableArray alloc] init];
        _webPData = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addImage:(UIImage *)image filename:(NSString *)filename
{
    NSData *data = [image dataWebPWithQuality:1.0];
    if(data)
    {
        [self.webPData addObject:data];
        [self.webPFiles addObject:filename];
    }
}

- (UIImage *)retrieveImageAtIndex:(NSUInteger)index
{
    UIImage *image = nil;
    if(index <= self.webPFiles.count)
    {
        NSData *data = self.webPData[index];
        image = [UIImage imageWithWebPData:data];
    }
    return image;
}

@end
