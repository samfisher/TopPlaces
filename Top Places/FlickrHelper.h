//
//  FlickrHelper.h
//  Top Places
//
//  Created by Sam Fisher on 10/21/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "FlickrFetcher.h"

@interface FlickrHelper : FlickrFetcher

+ (void)loadTopPlacesOnCompletion:(void (^)(NSArray *photos, NSError *error))completionHandler;

@end
