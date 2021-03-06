//
//  MADPhotoViewCell.h
//  WebPDemo
//
//  Created by Michael Davidson on 5/7/15.
//  Copyright (c) 2015 Michael Davidson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADPhotoViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImage *image;

- (void)setThumbnailImage:(UIImage *)thumbnailImage;

@end
