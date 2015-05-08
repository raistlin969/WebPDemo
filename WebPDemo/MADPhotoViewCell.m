//
//  MADPhotoViewCell.m
//  PhotoBrowse
//
//  Created by Michael Davidson on 5/6/15.
//  Copyright (c) 2015 Michael Davidson. All rights reserved.
//

#import "MADPhotoViewCell.h"

@interface MADPhotoViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation MADPhotoViewCell

- (void)setThumbnailImage:(UIImage *)thumbnailImage
{
    self.image = thumbnailImage;
    self.imageView.image = thumbnailImage;
}

@end
