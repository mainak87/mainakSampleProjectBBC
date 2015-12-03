//
//  ListPresenter.m
//  SmpleMVP
//
//  Created by Raja on 20/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

#import "ListViewPresenter.h"
#import "ListViewImpl.h"

@interface ListViewPresenter ()

@property (nonatomic, strong) ListViewImpl *listViewImpl;

@end

@implementation ListViewPresenter

- (instancetype)initWithListView:(id<ListViewCallBack>)listView
{
    if (self = [super init])
    {
        self.listView = listView;
        
        self.listViewImpl = [[ListViewImpl alloc] initWithListViewPresenter:self];
    }
    
    return self;
}

-(void)loadContent
{
    [self.listViewImpl loadListFromPlist];
}

-(void)displaycontent:(NSArray *)array
{
    [self.listView displayContent:array];
}

@end
