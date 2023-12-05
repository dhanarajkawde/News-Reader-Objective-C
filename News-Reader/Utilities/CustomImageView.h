//
//  CustomImageView.h
//  News-Reader
//
//  Created by Dhanraj Kawade on 04/12/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// Class of UIImageView to set UIImage to UIImageView  and store image in cache
@interface CustomImageView : UIImageView

/// server URL string
@property (nullable) NSString *imageURL;

/// To Load image fro Server URL String
/// - Parameter urlString: Server URL String
-(void) loadImageWithStringURL: (NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
