//
//  APIService.m
//  News-Reader
//
//  Created by Dhanraj Kawade on 04/12/23.
//

#import "APIService.h"
#import "News.h"

@implementation APIService

static NSString *const API_key = @"be27a8ef69a74526bb8665d3f63cd8fe"; // @"0cdf95b15cd2403c953bbfa203700a77";
static NSString *const urlBase = @"https://newsapi.org/v2/";

static NSString *const everything = @"%@everything?q=%@&apiKey=%@&pageSize=%ld&page=%ld&sortBy=%@";

+ (void) fetchNews:(NSString *)sortBy withSearchString:(NSString *)search withSize:(NSInteger)pageSize withPage:(NSInteger)page completion: (void (^)(NSMutableArray*, NSString*))callback {
    
    NSString *urlString = [NSString stringWithFormat: everything, urlBase, search, API_key, (long)pageSize, (long)page, sortBy];
    NSURL *url = [NSURL URLWithString:
        [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Request error: %@", error);
            return;
        }
        
        NSError *err;
        
        NSDictionary *newsJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        NSNumber *totalSize;
        NSString *status;
        NSString *message;
        NSMutableArray *articles = [[NSMutableArray alloc] init];
        
        @try {
            status = newsJSON[@"status"];
            
            if ([status isEqual: @"ok"]) { // if success in response
                totalSize = newsJSON[@"totalResults"];
                NSArray *articleArray = [newsJSON objectForKey: @"articles"];
                
                for (NSDictionary *article in articleArray) {
                    
                    Article *currentArticle = [[Article alloc] init];
                    
                    currentArticle.title = [article objectForKey: @"title"];
                    currentArticle.theDescription = [article objectForKey: @"description"];
                    currentArticle.urlToImage = [article objectForKey: @"urlToImage"];
                    currentArticle.author = [article objectForKey: @"author"];
                    currentArticle.publishedAt = [article objectForKey: @"publishedAt"];
                    currentArticle.url = [article objectForKey: @"url"];
                    
                    [articles addObject:currentArticle];
                }
                
                callback(articles, @"");
            }
            else {
                message = newsJSON[@"message"];
                callback(nil, message);
            }
        }@catch ( NSException *e ) {
            NSLog(@"JSON Parse error: %@", e);
            return;
        }
        
    }] resume];
}

+ (void)fetchImageData:(NSString*) imageURL completion:(void (^)(UIImage *))callback {
    UIImage *placeholderImage = [UIImage imageNamed:@"news-placeholder"];
    if (![imageURL isKindOfClass: NSNull.class]) { // if imageURL is empty
        NSURL *imgURL = [NSURL URLWithString: imageURL];
        
        [[NSURLSession.sharedSession dataTaskWithURL:(imgURL) completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                UIImage *returnImage = [[UIImage alloc] initWithData:data];
                
                callback(returnImage);
            }else{
                callback(placeholderImage);
                NSLog(@"IMAGE FETCH ERROR: %@",error);
            }
        }] resume] ;
    }
    else {
        callback(placeholderImage);
    }
}

@end
