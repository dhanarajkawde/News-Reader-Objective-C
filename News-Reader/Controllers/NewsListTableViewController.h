//
//  ViewController.h
//  News-Reader
//
//  Created by Dhanraj Kawade on 04/12/23.
//

#import <UIKit/UIKit.h>
#import "News.h"

/// NewsListTableViewController
@interface NewsListTableViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate>

/// IBOutlets
@property (weak, nonatomic) IBOutlet UISearchBar *searchBarNews;
@property (weak, nonatomic) IBOutlet UITableView *tblViwNews;

/// Properties
@property (nonatomic) NSMutableArray<Article *> *articles;
@property (readwrite, assign) NSInteger size;
@property (readwrite, assign) NSInteger pageNumber;
@property (nonatomic, copy) NSString *searchString;
@property (nonatomic) UIActivityIndicatorView *activityIndicator;

@end

