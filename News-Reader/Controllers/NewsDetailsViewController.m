//
//  NewsDetailsViewController.m
//  News-Reader
//
//  Created by Dhanraj Kawade on 05/12/23.
//

#import "NewsDetailsViewController.h"
#import "CustomImageView.h"
#import "Constants.h"

@interface NewsDetailsViewController ()

@end

@implementation NewsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"News Details";
    self.btnMoreDetails.layer.cornerRadius = self.btnMoreDetails.frame.size.height/2;
    
    [self setData];
}

/// Set News Data
- (void)setData {
    self.lblTitle.text = _news.title;
    self.lblDescription.text = _news.theDescription;
    self.lblAuthor.text = [NSString stringWithFormat:@"by: %@", _news.author];
    [self.imgViwNews loadImageWithStringURL: _news.urlToImage];
    
    self.lblDate.text = [NSString stringWithFormat:@"Date: %@", [Constants convertServerDateToCurrentDate:_news.publishedAt]];
}

/// Open Safari View for more details
/// - Parameter sender: sender description
- (IBAction)btnMoreDetailsClicked:(UIButton *)sender {
    SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:_news.url]];
    [self presentViewController:svc animated:YES completion:nil];
}

@end
