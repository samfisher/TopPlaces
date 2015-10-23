//
//  PhotosTableViewController.m
//  Top Places
//
//  Created by Sam Fisher on 10/22/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "PhotosTableViewController.h"
#import "ImageViewController.h"

@interface PhotosTableViewController ()

@end

@implementation PhotosTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Properties
- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // TODO: Incomplete implementation, return the number of sections
    return 0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.photos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Photo Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath];
    
    NSDictionary *photo = self.photos[indexPath.row];
    cell.textLabel.text = [FlickrHelper titleOfPhoto:photo];
    cell.detailTextLabel.text = [FlickrHelper subtitleOfPhoto:photo];
    
    return cell;
}

- (void)prepareImageViewController:(ImageViewController *)vc
              forPhoto:(NSDictionary *)photo
{
    vc.imageURL = [FlickrHelper URLforPhoto:photo];
    vc.title = [FlickrHelper titleOfPhoto:photo];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if ([segue.identifier isEqualToString:@"Show Photo"] && indexPath) {
        [self prepareImageViewController:segue.destinationViewController
                    forPhoto:self.photos[indexPath.row]];
    }
}

@end
