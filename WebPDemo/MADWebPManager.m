//
//  MADWebPManager.m
//  WebPDemo
//
//  Created by Michael Davidson on 5/7/15.
//  Copyright (c) 2015 Michael Davidson. All rights reserved.
//

#import "MADWebPManager.h"
#import "WebP/UIImage+WebP.h"

@implementation MADWebPManager

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _webPFiles = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addImage:(UIImage *)image filename:(NSString *)filename
{
    if([image writeWebPLosslessToDocumentsWithFileName:filename])
    {
        [self.webPFiles addObject:filename];
    }
}

- (UIImage *)retrieveImageAtIndex:(NSUInteger)index
{
    UIImage *image = nil;
    if(index <= self.webPFiles.count)
    {
        NSString *filename = self.webPFiles[index];
        image = [UIImage imageWithWebPAtPath:filename];
    }
    return image;
}

@end
