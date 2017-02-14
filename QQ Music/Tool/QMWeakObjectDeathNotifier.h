//
//  QMWeakObjectDeathNotifier.h
//  
//
//  Created by 沈梦月 on 16/8/23.
//
//

#import <Foundation/Foundation.h>

//当owner释放的时候通知block
@class QMWeakObjectDeathNotifier;

typedef void(^JPWeakObjectDeathNotifierBlock)(QMWeakObjectDeathNotifier *sender);

@interface QMWeakObjectDeathNotifier : NSObject

@property (nonatomic, weak) id owner;
@property (nonatomic, strong) id data;

- (void)setBlock:(JPWeakObjectDeathNotifierBlock)block;

@end