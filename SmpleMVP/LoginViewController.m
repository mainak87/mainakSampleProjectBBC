//
//  ViewController.m
//  SmpleMVP
//
//  Created by Raja on 16/09/15.
//  Copyright (c) 2015 CTS. All rights reserved.
//

#import "LoginViewController.h"

#import "LoginViewPresenter.h"
#import "FakeAccountRepository.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginViewPresenter *loginPresenter;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.loginPresenter = [self presenterForLogin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)singInButtonClicked:(id)sender
{
    [self.loginPresenter signInWithUserName:self.userNameTextField.text andPassword:self.passwordTextField.text];
}

- (IBAction)registerButtonClicked:(id)sender
{
    [self.loginPresenter registerAccountUserName:self.userNameTextField.text andPassword:self.passwordTextField.text];
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if (self.userNameTextField == textField) {
        [self.passwordTextField becomeFirstResponder];
    }
    
    return YES;
}

#pragma mark - Presenter

-(LoginViewPresenter *)presenterForLogin
{
    id <AccountRepositoryDelegate> fakeRepository = [[FakeAccountRepository alloc] init];
    LoginViewPresenter *presenter = [[LoginViewPresenter alloc] initWithRepository:fakeRepository andLoginView:self];
    
    return presenter;
}

#pragma mark - LoginViewCallBack Methods

-(void)loginSuccess:(NSString *)successMessage
{
    NSLog(@"Login Success : %@", successMessage);
}

-(void)loginFailed:(NSString *)failureMessage
{
    NSLog(@"Failed to Login : %@", failureMessage);
}

-(void)userRegisterationSuccess:(NSString *)successMessage
{
    NSLog(@"Registration Success : %@", successMessage);
}

-(void)userRegisterationFailed:(NSString *)failureMessage
{
    NSLog(@"Failed to Register : %@", failureMessage);
}

@end
