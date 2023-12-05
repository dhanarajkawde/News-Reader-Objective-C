//
//  Constants.h
//  News-Reader-Objective-C
//
//  Created by Dhanraj Kawade on 05/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Constants : NSObject

FOUNDATION_EXPORT NSString *const staticSearchString;
FOUNDATION_EXPORT NSString *const dateFormatterToParse;
FOUNDATION_EXPORT NSString *const dateFormatterToSet;

+ (NSString *)convertServerDateToCurrentDate:(NSString *)serverDate;

@end

NS_ASSUME_NONNULL_END
