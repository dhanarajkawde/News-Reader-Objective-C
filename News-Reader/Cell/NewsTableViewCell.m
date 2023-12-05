//
//  NewsTableViewCell.m
//  News-Reader
//
//  Created by Dhanraj Kawade on 04/12/23.
//

#import "NewsTableViewCell.h"
#import "News.h"
#import "CustomImageView.h"
#import "Constants.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.viwBack.layer.cornerRadius = 10;
    self.imgViwNews.layer.cornerRadius = 10;
    [self addShadow];
}

- (void)addShadow {
    self.viwBack.layer.shadowColor = [UIColor blackColor].CGColor;
    self.viwBack.layer.shadowOffset = CGSizeMake(0, 1);
    self.viwBack.layer.shadowRadius = 5;
    self.viwBack.layer.shadowOpacity = 0.4;
}

- (void)setData:(Article *)article {
    self.lblTitle.text = article.title;
    
    if ([article.theDescription isKindOfClass:[NSString class]]) {
        self.lblDescription.text = article.theDescription;
    }
    else {
        self.lblDescription.text = @"";
    }
    
    [self.imgViwNews loadImageWithStringURL: article.urlToImage];
    
    self.lblPublishedDate.text = [NSString stringWithFormat:@"Date: %@", [Constants convertServerDateToCurrentDate:article.publishedAt]];
}


@end
