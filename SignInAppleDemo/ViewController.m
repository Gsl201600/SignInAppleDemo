//
//  ViewController.m
//  SignInAppleDemo
//
//  Created by Yostar on 2019/8/19.
//  Copyright © 2019 Yostar. All rights reserved.
//

#import "ViewController.h"
#import <AuthenticationServices/AuthenticationServices.h>
#import "SignInApple.h"

@interface ViewController ()

// 防止被释放，回调方法不会走，或者也可以把SignInApple这个类写成单例
@property (nonatomic, strong) SignInApple *signInApple;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self perfomExistingAccount];
}

- (void)configUI{
    // 使用系统提供的按钮，要注意不支持系统版本的处理
    if (@available(iOS 13.0, *)) {
        // Sign In With Apple Button
        ASAuthorizationAppleIDButton *appleIDBtn = [ASAuthorizationAppleIDButton buttonWithType:ASAuthorizationAppleIDButtonTypeDefault style:ASAuthorizationAppleIDButtonStyleWhite];
        appleIDBtn.frame = CGRectMake(30, self.view.bounds.size.height - 180, self.view.bounds.size.width - 60, 100);
        //    appleBtn.cornerRadius = 22.f;
        [appleIDBtn addTarget:self action:@selector(didAppleIDBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:appleIDBtn];
    }
    
    // 或者自己用UIButton实现按钮样式
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(30, 80, self.view.bounds.size.width - 60, 44);
    addBtn.backgroundColor = [UIColor orangeColor];
    [addBtn setTitle:@"Sign in with Apple" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(didCustomBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
}

// 自己用UIButton按钮调用处理授权的方法
- (void)didCustomBtnClicked{
    self.signInApple = [[SignInApple alloc] init];
    [self.signInApple handleAuthorizationAppleIDButtonPress];
}

// 使用系统提供的按钮调用处理授权的方法
- (void)didAppleIDBtnClicked{
    self.signInApple = [[SignInApple alloc] init];
    [self.signInApple handleAuthorizationAppleIDButtonPress];
}

// 如果存在iCloud Keychain 凭证或者AppleID 凭证提示用户
- (void)perfomExistingAccount{
    self.signInApple = [[SignInApple alloc] init];
    [self.signInApple perfomExistingAccountSetupFlows];
}

@end
