//
//  MADPhotosCollectionViewController.h
//  WebPDemo
//
//  Created by Michael Davidson on 5/7/15.
//  Copyright (c) 2015 Michael Davidson. All rights reserved.
//

#import <UIKit/UIKit.h>

@import Photos;

@interface MADPhotosCollectionViewController : UICollectionViewController

@property (weak, nonatomic)PHFetchResult *allPhotosFetchResult;

@end
