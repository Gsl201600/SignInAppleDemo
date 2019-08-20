//
//  YostarKeychain.h
//  YostarUtilits
//
//  Created by Yostar on 2018/6/21.
//  Copyright © 2018年 Yostar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YostarKeychain : NSObject

// save ... to keychain
+ (void)save:(NSString *)service data:(id)data;

// take out ... from keychain
+ (id)load:(NSString *)service;

// delete ... from keychain
+ (void)delete:(NSString *)service;

@end
