//
//  ListViewImpl.m
//  SmpleMVP
//
//  Created by Raja on 20/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

#import "ListViewImpl.h"
#import "News.h"

@implementation ListViewImpl

- (instancetype)initWithListViewPresenter:(id<ListViewDelegate>)listPresenter
{
    if (self = [super init]) {
        self.listPresenter = listPresenter;
    }
    
    return self;
}

- (void)loadListFromPlist
{
    //NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ListSample" ofType:@"plist"];
   // NSMutableArray *listArray = [NSMutableArray arrayWithContentsOfFile:plistPath];
    
   // [self.listPresenter displaycontent:listArray];
    
    
    NSMutableArray *listArray = [[NSMutableArray alloc] init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"stub" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    for (NSDictionary * dictionay in jsonDict) {
        News * news = [[News alloc] init];
        news.title = [dictionay objectForKey:@"title"];
        [listArray addObject:news];
    }
    
    [self.listPresenter displaycontent:listArray];
}

@end
