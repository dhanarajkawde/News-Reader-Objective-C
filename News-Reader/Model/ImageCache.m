//
//  ImageCache.m
//  News-Reader
//
//  Created by Dhanraj Kawade on 04/12/23.
//

#import <Foundation/Foundation.h>
#import "ImageCache.h"

@implementation ImageCache

@synthesize cache;

//#pragma mark Singleton Methods

+ (id)sharedManager {
    static ImageCache *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        cache = [[NSCache alloc] init];
    }
    return self;
}


@end
