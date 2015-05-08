//
//  MADWebPTableViewController.m
//  WebPDemo
//
//  Created by Michael Davidson on 5/7/15.
//  Copyright (c) 2015 Michael Davidson. All rights reserved.
//

#import "MADWebPTableViewController.h"
#import "MADWebPManager.h"
#import "MADPhotosCollectionViewController.h"

@import Photos;

@interface MADWebPTableViewController ()

@property (strong, nonatomic)MADWebPManager *webPManager;
@property (strong, nonatomic)PHFetchResult *allPhotosFetchResult;

@end

@implementation MADWebPTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        _webPManager = [[MADWebPManager alloc]init];
        NSData *nameData = [[NSUserDefaults standardUserDefaults] objectForKey:@"names"];

        //if no data was loaded, than this is the first time running the program
        if(nameData != nil)
            _webPManager.webPFiles = [NSKeyedUnarchiver unarchiveObjectWithData:nameData];

        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if(status != PHAuthorizationStatusAuthorized)
        {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                [self fetchAllPhotoAssets];
            }];
        }
        else
        {
            [self fetchAllPhotoAssets];
        }
    }
    return self;

}

- (void)fetchAllPhotoAssets
{
    PHFetchOptions *options = [PHFetchOptions new];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    _allPhotosFetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:options];
}

- (void)dealloc
{
    [self saveFilenames];
}

- (void)saveFilenames
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.webPManager.webPFiles];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"names"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.webPManager.webPFiles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.webPManager.webPFiles[indexPath.row];
    return cell;
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"ShowPhotoCollection"])
    {
        MADPhotosCollectionViewController *viewController = segue.destinationViewController;
        viewController.allPhotosFetchResult = self.allPhotosFetchResult;
    }
}


@end
