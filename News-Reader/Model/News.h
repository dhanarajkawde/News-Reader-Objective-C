//
//  News.h
//  News-Reader
//
//  Created by Dhanraj Kawade on 04/12/23.
//

#import <Foundation/Foundation.h>
#import "Article.h"

@class News;
@class Article;
@class Source;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface News : NSObject

@property (nonatomic, copy)   NSString *status;
@property (nonatomic, assign) NSInteger totalResults;
@property (nonatomic, copy)   NSMutableArray<Article *> *articles;

@end

@interface Source : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
