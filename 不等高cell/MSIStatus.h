//
//  MSIStatus.h
//  不等高cell
//
//  Created by s on 2020/7/21.
//  Copyright © 2020 s. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSIStatus : NSObject
/** 图像 */
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign,getter=isVip)BOOL vip;
@property(nonatomic,copy)NSString *picture;
@end

NS_ASSUME_NONNULL_END
