//
//  Constants.m
//  News-Reader-Objective-C
//
//  Created by Dhanraj Kawade on 05/12/23.
//

#import "Constants.h"

/// Class to store reuse variables and methods
@implementation Constants

NSString *const staticSearchString = @"feed";
NSString *const dateFormatterToParse = @"yyyy-MM-dd'T'HH:mm:SSZ";
NSString *const dateFormatterToSet = @"dd-MM-yyyy";

/// Convert Server date format to readable date format
/// - Parameter serverDate: server date
+ (NSString *)convertServerDateToCurrentDate:(NSString *)serverDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormatterToParse];
    NSDate *date = [dateFormatter dateFromString:serverDate];
    [dateFormatter setDateFormat:dateFormatterToSet];
    return [dateFormatter stringFromDate:date];
}

@end
