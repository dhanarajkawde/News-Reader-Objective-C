//
//  NewsTableViewCell.h
//  News-Reader
//
//  Created by Dhanraj Kawade on 04/12/23.
//

#import <UIKit/UIKit.h>
#import "CustomImageView.h"
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

/// NewsTableViewCell
@interface NewsTableViewCell : UITableViewCell

/// Properties
@property (weak, nonatomic) IBOutlet UIView *viwBack;
@property (weak, nonatomic) IBOutlet CustomImageView *imgViwNews;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPublishedDate;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@property (nonatomic) Article *news;

/// Set data to cell
/// - Parameter article: article description
- (void)setData:(Article *)article;

@end

NS_ASSUME_NONNULL_END
