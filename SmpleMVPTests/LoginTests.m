//
//  LoginTests.m
//  SmpleMVP
//
//  Created by Raja on 16/09/15.
//  Copyright (c) 2015 CTS. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "LoginViewDelegate.h"
#import "LoginViewPresenter.h"
#import "AccountRepositoryDelegate.h"
#import "FakeAccountRepository.h"
#import "FakeLoginViewController.h"

@interface LoginTests : XCTestCase

@end

@implementation LoginTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testUserSigInWithEmptyUserNameAndPassword
{
    FakeLoginViewController *fakeViewController = [[FakeLoginViewController alloc] init];
    
    id <AccountRepositoryDelegate> fakeRepository = [[FakeAccountRepository alloc] init];
    id<LoginViewDelegate> presenter = [[LoginViewPresenter alloc] initWithRepository:fakeRepository andLoginView:fakeViewController];
    
    [presenter signInWithUserName:@"" andPassword:@""];
    
    XCTAssertFalse(fakeViewController.isLoginSuccessed);
    XCTAssertTrue([fakeViewController.message isEqualToString:@"UserName is empty"]);
}

- (void)testUserSigInWithEmptyPassword
{
    FakeLoginViewController *fakeViewController = [[FakeLoginViewController alloc] init];
    
    id <AccountRepositoryDelegate> fakeRepository = [[FakeAccountRepository alloc] init];
    id<LoginViewDelegate> presenter = [[LoginViewPresenter alloc] initWithRepository:fakeRepository andLoginView:fakeViewController];
    
    [presenter signInWithUserName:@"user1" andPassword:@""];
    
    XCTAssertFalse(fakeViewController.isLoginSuccessed);
    XCTAssertTrue([fakeViewController.message isEqualToString:@"Password is empty"]);
}

- (void)testUserSigIn
{
    FakeLoginViewController *fakeViewController = [[FakeLoginViewController alloc] init];
    
    id <AccountRepositoryDelegate> fakeRepository = [[FakeAccountRepository alloc] init];
    id<LoginViewDelegate> presenter = [[LoginViewPresenter alloc] initWithRepository:fakeRepository andLoginView:fakeViewController];
    
    [presenter signInWithUserName:@"user1" andPassword:@"pass"];

    XCTAssertTrue(fakeViewController.isLoginSuccessed);
    XCTAssertTrue([fakeViewController.message isEqualToString:@"Logged in successfully"]);
}

- (void)testUserSigInFailed
{
    FakeLoginViewController *fakeViewController = [[FakeLoginViewController alloc] init];
    
    id <AccountRepositoryDelegate> fakeRepository = [[FakeAccountRepository alloc] init];
    id<LoginViewDelegate> presenter = [[LoginViewPresenter alloc] initWithRepository:fakeRepository andLoginView:fakeViewController];
    
    [presenter signInWithUserName:@"user6" andPassword:@"pass"];
    
    XCTAssertFalse(fakeViewController.isLoginSuccessed);
    XCTAssertTrue([fakeViewController.message isEqualToString:@"UserName not registered"]);
}

- (void)testRegisterUserWithEmptyUserNameAndPassword
{
    FakeLoginViewController *fakeViewController = [[FakeLoginViewController alloc] init];
    
    id <AccountRepositoryDelegate> fakeRepository = [[FakeAccountRepository alloc] init];
    id<LoginViewDelegate> presenter = [[LoginViewPresenter alloc] initWithRepository:fakeRepository andLoginView:fakeViewController];
    
    ;
    
    [presenter registerAccountUserName:@"" andPassword:@""];
    
    XCTAssertFalse(fakeViewController.isRegistrationSuccessed);
    XCTAssertTrue([fakeViewController.message isEqualToString:@"UserName is empty"]);
}

- (void)testRegisterUserWithEmptyPassword
{
    FakeLoginViewController *fakeViewController = [[FakeLoginViewController alloc] init];
    
    id <AccountRepositoryDelegate> fakeRepository = [[FakeAccountRepository alloc] init];
    id<LoginViewDelegate> presenter = [[LoginViewPresenter alloc] initWithRepository:fakeRepository andLoginView:fakeViewController];
    
    ;
    
    [presenter registerAccountUserName:@"user7" andPassword:@""];
    
    XCTAssertFalse(fakeViewController.isRegistrationSuccessed);
    XCTAssertTrue([fakeViewController.message isEqualToString:@"Password is empty"]);
}

- (void)testRegisterUser
{
    FakeLoginViewController *fakeViewController = [[FakeLoginViewController alloc] init];
    
    id <AccountRepositoryDelegate> fakeRepository = [[FakeAccountRepository alloc] init];
    id<LoginViewDelegate> presenter = [[LoginViewPresenter alloc] initWithRepository:fakeRepository andLoginView:fakeViewController];
    
    ;
    
    [presenter registerAccountUserName:@"user7" andPassword:@"pass"];
    
    XCTAssertTrue(fakeViewController.isRegistrationSuccessed);
    XCTAssertTrue([fakeViewController.message isEqualToString:@"User registered successfully"]);
}

- (void)testAlreadyRegisteredUser
{
    FakeLoginViewController *fakeViewController = [[FakeLoginViewController alloc] init];
    
    id <AccountRepositoryDelegate> fakeRepository = [[FakeAccountRepository alloc] init];
    id<LoginViewDelegate> presenter = [[LoginViewPresenter alloc] initWithRepository:fakeRepository andLoginView:fakeViewController];
    
    ;
    
    [presenter registerAccountUserName:@"user1" andPassword:@"pass"];
    
    XCTAssertFalse(fakeViewController.isRegistrationSuccessed);
    XCTAssertTrue([fakeViewController.message isEqualToString:@"User already exists"]);
}

@end
