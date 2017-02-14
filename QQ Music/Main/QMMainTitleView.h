//
//  QMMainTitleView.h
//  QQ Music
//
//  Created by 沈梦月 on 16/8/22.
//  Copyright © 2016年 mengyue. All rights reserved.
//

#import <UIKit/UIKit.h>



@class QMMainTitleView;

@protocol QMMainTitleViewDelegate <NSObject>

-(void)mainTitleView:(QMMainTitleView *)view clickIndex:(NSInteger)index;

@end


@interface QMMainTitleView : UIView


@property (nonatomic, assign) id<QMMainTitleViewDelegate> delegate;

@property (nonatomic, assign) NSInteger selecteIndex;

@end
