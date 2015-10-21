//
//  FlickrHelper.m
//  Top Places
//
//  Created by Sam Fisher on 10/21/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "FlickrHelper.h"

@implementation FlickrHelper


+ (void)loadTopPlacesOnCompletion:(void (^)(NSArray *photos, NSError *error))completionHandler
{
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:[FlickrHelper URLforTopPlaces]
                                                completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error)
                                      {
                                          NSArray *places;
                                          
                                          if (!error)
                                          {
                                              places = [[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:location]
                                                                                        options:0
                                                                                          error:&error] valueForKeyPath:FLICKR_RESULTS_PLACES];
                                          }
                                          
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              completionHandler(places, error);
                                          });
                                      }];
    [task resume];
}

@end
