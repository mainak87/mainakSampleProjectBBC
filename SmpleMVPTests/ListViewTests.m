//
//  ListViewTests.m
//  SmpleMVP
//
//  Created by Raja on 20/09/15.
//  Copyright © 2015 CTS. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ListViewImpl.h"
#import "ListViewPresenter.h"
#import "FakeListViewController.h"

@interface ListViewTests : XCTestCase

@end

@implementation ListViewTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testListViewContent
{
    FakeListViewController *listView = [[FakeListViewController alloc] init];
    
    id<ListViewDelegate> listViewPresenter = [[ListViewPresenter alloc] initWithListView:listView];
    
    [listViewPresenter loadContent];
    
    XCTAssertTrue([listView.listContentArray count]);
}

@end
