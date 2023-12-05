//
//  CustomImageView.m
//  News-Reader
//
//  Created by Dhanraj Kawade on 04/12/23.
//

#import "CustomImageView.h"
#import "ImageCache.h"
#import "APIService.h"
  
@implementation CustomImageView

- (void)loadImageWithStringURL:(NSString *) urlString {

    self.imageURL = urlString;
    
    self.image = nil;
    
    if([[ImageCache.sharedManager cache] objectForKey:urlString]) {
        self.image = [[ImageCache.sharedManager cache] objectForKey:urlString];
        return;
    }
    
    [APIService fetchImageData: urlString completion:^(UIImage * returnImage) {
        
        if (self.imageURL == urlString) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = returnImage;
            });
        }
        
        [[ImageCache.sharedManager cache] setObject:returnImage forKey:urlString];
    }];
}

@end
