//
//  SignInApple.h
//  SignInAppleDemo
//
//  Created by Yostar on 2019/11/25.
//  Copyright © 2019 Yostar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignInApple : NSObject

// 处理授权
- (void)handleAuthorizationAppleIDButtonPress;

// 如果存在iCloud Keychain 凭证或者AppleID 凭证提示用户
- (void)perfomExistingAccountSetupFlows;

@end

NS_ASSUME_NONNULL_END
