//
//  MADWebPManager.h
//  WebPDemo
//
//  Created by Michael Davidson on 5/7/15.
//  Copyright (c) 2015 Michael Davidson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MADWebPManager : NSObject

@property (strong, nonatomic)NSMutableArray *webPFiles;

- (void)addImage:(UIImage *)image filename:(NSString *)filename;
- (UIImage *)retrieveImageAtIndex:(NSUInteger)index;

@end
