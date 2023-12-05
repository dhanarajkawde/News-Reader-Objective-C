//
//  APIService.h
//  News-Reader
//
//  Created by Dhanraj Kawade on 04/12/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// Class to manage API calls
@interface APIService : NSObject

/// Base URL
@property NSString *const urlBase;

/// Fetch news from Server
/// - Parameters:
///   - sortBy: sortBy description
///   - search: search description
///   - pageSize: pageSize description
///   - page: page description
///   - callback: callback description
+ (void) fetchNews:(NSString *)sortBy withSearchString:(NSString *)search withSize:(NSInteger)pageSize withPage:(NSInteger)page completion: (void (^)(NSMutableArray*, NSString*))callback;

/// Fetch image from Server
/// - Parameters:
///   - imageURL: imageURL description
///   - callback: return UIImage
+ (void) fetchImageData:(NSString* )imageURL completion:(void (^)(UIImage *))callback;

@end

NS_ASSUME_NONNULL_END
