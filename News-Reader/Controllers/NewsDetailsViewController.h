//
//  NewsDetailsViewController.h
//  News-Reader
//
//  Created by Dhanraj Kawade on 05/12/23.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "CustomImageView.h"
#import <SafariServices/SafariServices.h>

NS_ASSUME_NONNULL_BEGIN

/// NewsDetailsViewController
@interface NewsDetailsViewController : UIViewController

/// IBOutlets
@property (weak, nonatomic) IBOutlet UIScrollView *scrlViwCustom;
@property (weak, nonatomic) IBOutlet UIView *viwBack;
@property (weak, nonatomic) IBOutlet CustomImageView *imgViwNews;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblAuthor;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnMoreDetails;

/// Properties
@property (nonatomic) Article *news;

@end

NS_ASSUME_NONNULL_END
