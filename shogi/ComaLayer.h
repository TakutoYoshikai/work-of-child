//
//  ComaLayer.h
//  将棋
//
//  Created by 拓人 吉開 on 12/02/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
@interface ComaLayer : CALayer{
    int type;
    int player;
    int count;
    UIViewController *main;
}
-(BOOL)check:(CGPoint)pos;
@property (assign) int type;
@property (assign) int count;
@property (assign) int player;
@end
