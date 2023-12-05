//
//  ViewController.m
//  News-Reader
//
//  Created by Dhanraj Kawade on 04/12/23.
//

#import "NewsListTableViewController.h"
#import "NewsTableViewCell.h"
#import "APIService.h"
#import "NewsDetailsViewController.h"
#import "Constants.h"

static NSString *CellIdentifier = @"NewsTableViewCell";

@interface NewsListTableViewController ()

@end

@implementation NewsListTableViewController

// MARK: Controller Life cycle methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tblViwNews registerNib:[UINib nibWithNibName:CellIdentifier bundle:nil] forCellReuseIdentifier:CellIdentifier];
    
    self.size = 100;
    self.pageNumber = 1;
    self.searchString = staticSearchString;
   
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    _activityIndicator.alpha = 1.0;
    [self.view addSubview:_activityIndicator];
    _activityIndicator.center = CGPointMake([[UIScreen mainScreen]bounds].size.width/2, [[UIScreen mainScreen]bounds].size.height/2);
    
    [self fetchNews:self.searchString];
}

// MARK: Custom methods

/// Fetch news from server
/// - Parameter searchStr: search string
- (void)fetchNews:(NSString *)searchStr {
    [_activityIndicator startAnimating];
        
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [APIService fetchNews:@"relevancy" withSearchString:searchStr withSize:self.size withPage:self.pageNumber completion:^(NSMutableArray *news, NSString *errorMessage) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.activityIndicator stopAnimating];
            if (![errorMessage isEqual: @""]) { // if failure in response
                [self showAlertMsg:self title:@"Error" message:errorMessage];
            }
            else {
                if (news != nil) { // if news object is empty means no response in API call
                    if (self.articles == nil) {
                        self.articles = news;
                    }
                    else {
                        [self.articles addObjectsFromArray:news];
                    }
                    [self.tblViwNews reloadData];
                }
            }
        });
    }];
}

/// Show Alert
/// - Parameters:
///   - viewController: viewController description
///   - title: title description
///   - message: message description
- (void) showAlertMsg:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message {

    UIAlertController * alert = [UIAlertController alertControllerWithTitle : title
                                                                    message : message
                                                             preferredStyle : UIAlertControllerStyleAlert];

    UIAlertAction * ok = [UIAlertAction
                          actionWithTitle:@"OK"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          { }];

    [alert addAction:ok];
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewController presentViewController:alert animated:YES completion:nil];
    });
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.articles count];
}

// MARK: UITableViewDataSource,UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [cell setData:_articles[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewsDetailsViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"NewsDetailsViewController"];
    controller.news = [_articles objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.articles.count > 1){ // handle pagination
        if(indexPath.row == self.articles.count - 1) {
            _pageNumber = _pageNumber + 1;
            [self fetchNews:self.searchString];
        }
    }
}

// MARK: UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (![searchBar.text isEqual: @""]) { // if search text is not empty
        _searchString = searchBar.text;
    }
    else {
        _searchString = staticSearchString;
    }
    _articles = nil;
    _pageNumber = 1;
    [self fetchNews:_searchString];
    [self.view endEditing:true];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText isEqual: @""]) { // if search text is empty
        _articles = nil;
        _searchString = staticSearchString;
        _pageNumber = 1;
        [self fetchNews:self.searchString];
        [self.view endEditing:true];
    }
}

@end
