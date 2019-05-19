//
//  ViewController.m
//  オセロ
//
//  Created by 拓人 吉開 on 12/02/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@implementation ViewController
@synthesize label;

-(IBAction)marking{
    int B = 0;
    int W = 0;
    CALayer *test;
    for(int i = 0; i < 8; i++){
        for(int j = 0; j < 8; j++){
            test = [self.view.layer hitTest:CGPointMake(100 + 80 * i, 100 + 80 * j)];
            if([test.name isEqualToString:@"Black"]){
                B++;
            } else if([test.name isEqualToString:@"White"]){
                W++;
            }
        }
    }
    label.text = [NSString stringWithFormat:@"黒 = %d, 白 = %d", B, W];
    
}
-(BOOL)top:(CGPoint)pos{
    CGPoint pos1 = pos;
    CALayer *test;
    BOOL B;
    if(BW == YES){
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"Black"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"Black"]){
                    B = YES;
                    break;
                }
            }
            
        }
    } else {
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"White"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"White"]){
                    B = YES;
                    break;
                }
            }
            
        }
    }
    return B;
}

-(BOOL)left:(CGPoint)pos{
    CGPoint pos1 = pos;
    CALayer *test;
    BOOL B;
    if(BW == YES){
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"Black"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"Black"]){
                    B = YES;
                    break;
                }
            }
            
        }
    } else {
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"White"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"White"]){
                    B = YES;
                    break;
                }
            }
            
        }
    }
    return B;
}

-(BOOL)right:(CGPoint)pos{
    CGPoint pos1 = pos;
    CALayer *test;
    BOOL B;
    if(BW == YES){
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"Black"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"Black"]){
                    B = YES;
                    break;
                }
            }
            
        }
    } else {
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"White"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"White"]){
                    B = YES;
                    break;
                }
            }
            
        }
    }
    return B;
}

-(BOOL)bottom:(CGPoint)pos{
    CGPoint pos1 = pos;
    CALayer *test;
    BOOL B;
    if(BW == YES){
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"Black"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"Black"]){
                    B = YES;
                    break;
                }
            }
            
        }
    } else {
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"White"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"White"]){
                    B = YES;
                    break;
                }
            }
            
        }
    }
    return B;
}

-(BOOL)top_left:(CGPoint)pos{
    CGPoint pos1 = pos;
    CALayer *test;
    BOOL B;
    if(BW == YES){
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y -= 80;
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"Black"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"Black"]){
                    B = YES;
                    break;
                }
            }
            
        }
    } else {
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y -= 80;
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"White"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"White"]){
                    B = YES;
                    break;
                }
            }
            
        }
    }
    return B;
}

-(BOOL)top_right:(CGPoint)pos{
    CGPoint pos1 = pos;
    CALayer *test;
    BOOL B;
    if(BW == YES){
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y -= 80;
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"Black"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"Black"]){
                    B = YES;
                    break;
                }
            }
            
        }
    } else {
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y -= 80;
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"White"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"White"]){
                    B = YES;
                    break;
                }
            }
            
        }
    }
    return B;
}

-(BOOL)bottom_left:(CGPoint)pos{
    CGPoint pos1 = pos;
    CALayer *test;
    BOOL B;
    if(BW == YES){
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y += 80;
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"Black"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"Black"]){
                    B = YES;
                    break;
                }
            }
            
        }
    } else {
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y += 80;
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"White"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"White"]){
                    B = YES;
                    break;
                }
            }
            
        }
    }
    return B;
}

-(BOOL)bottom_right:(CGPoint)pos{
    CGPoint pos1 = pos;
    CALayer *test;
    BOOL B;
    if(BW == YES){
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y += 80;
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"Black"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"Black"]){
                    B = YES;
                    break;
                }
            }
            
        }
    } else {
        pos1 = pos;
        for(int i = 0; i < 8; i++){
            pos1.y += 80;
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                B = NO;
                break;
            }
            if(i == 0){
                if([test.name isEqualToString:@"White"]){
                    B = NO;
                    break;
                }
            } else {
                if([test.name isEqualToString:@"White"]){
                    B = YES;
                    break;
                }
            }
            
        }
    }
    return B;
}

-(void)chenge_top:(CGPoint)pos{
    CGPoint pos1 = pos;
    CGPoint pos2 = pos;
    int a;
    CALayer *test = [CALayer layer];
    if(BW == YES){
        for(int i = 1; i < 8; i++){
            pos1.y -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"Black"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"Black"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y -= 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"black.png"].CGImage;
            test.name = @"Black";
        }
    } else{
        for(int i = 1; i < 8; i++){
            pos1.y -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"White"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"White"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y -= 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"white.png"].CGImage;
            test.name = @"White";
        }
    }
}

-(void)chenge_left:(CGPoint)pos{
    CGPoint pos1 = pos;
    CGPoint pos2 = pos;
    int a;
    CALayer *test = [CALayer layer];
    if(BW == YES){
        for(int i = 1; i < 8; i++){
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"Black"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"Black"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.x -= 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"black.png"].CGImage;
            test.name = @"Black";
        }
    } else{
        for(int i = 1; i < 8; i++){
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"White"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"White"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.x -= 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"white.png"].CGImage;
            test.name = @"White";
        }
    }
}

-(void)chenge_right:(CGPoint)pos{
    CGPoint pos1 = pos;
    CGPoint pos2 = pos;
    int a;
    CALayer *test = [CALayer layer];
    if(BW == YES){
        for(int i = 1; i < 8; i++){
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"Black"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"Black"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.x += 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"black.png"].CGImage;
            test.name = @"Black";
        }
    } else{
        for(int i = 1; i < 8; i++){
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"White"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"White"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.x += 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"white.png"].CGImage;
            test.name = @"White";
        }
    }
}

-(void)chenge_bottom:(CGPoint)pos{
    CGPoint pos1 = pos;
    CGPoint pos2 = pos;
    int a;
    CALayer *test = [CALayer layer];
    if(BW == YES){
        for(int i = 1; i < 8; i++){
            pos1.y += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"Black"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"Black"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y += 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"black.png"].CGImage;
            test.name = @"Black";
        }
    } else{
        for(int i = 1; i < 8; i++){
            pos1.y += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"White"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"White"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y += 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"white.png"].CGImage;
            test.name = @"White";
        }
    }
}

-(void)chenge_top_left:(CGPoint)pos{
    CGPoint pos1 = pos;
    CGPoint pos2 = pos;
    int a;
    CALayer *test = [CALayer layer];
    if(BW == YES){
        for(int i = 1; i < 8; i++){
            pos1.y -= 80;
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"Black"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"Black"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y -= 80;
            pos2.x -= 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"black.png"].CGImage;
            test.name = @"Black";
        }
    } else{
        for(int i = 1; i < 8; i++){
            pos1.y -= 80;
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"White"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"White"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y -= 80;
            pos2.x -= 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"white.png"].CGImage;
            test.name = @"White";
        }
    }
}

-(void)chenge_top_right:(CGPoint)pos{
    CGPoint pos1 = pos;
    CGPoint pos2 = pos;
    int a;
    CALayer *test = [CALayer layer];
    if(BW == YES){
        for(int i = 1; i < 8; i++){
            pos1.y -= 80;
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"Black"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"Black"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y -= 80;
            pos2.x += 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"black.png"].CGImage;
            test.name = @"Black";
        }
    } else{
        for(int i = 1; i < 8; i++){
            pos1.y -= 80;
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"White"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"White"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y -= 80;
            pos2.x += 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"white.png"].CGImage;
            test.name = @"White";
        }
    }
}

-(void)chenge_bottom_left:(CGPoint)pos{
    CGPoint pos1 = pos;
    CGPoint pos2 = pos;
    int a;
    CALayer *test = [CALayer layer];
    if(BW == YES){
        for(int i = 1; i < 8; i++){
            pos1.y += 80;
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"Black"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"Black"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y += 80;
            pos2.x -= 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"black.png"].CGImage;
            test.name = @"Black";
        }
    } else{
        for(int i = 1; i < 8; i++){
            pos1.y += 80;
            pos1.x -= 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"White"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"White"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y += 80;
            pos2.x -= 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"white.png"].CGImage;
            test.name = @"White";
        }
    }
}

-(void)chenge_bottom_right:(CGPoint)pos{
    CGPoint pos1 = pos;
    CGPoint pos2 = pos;
    int a;
    CALayer *test = [CALayer layer];
    if(BW == YES){
        for(int i = 1; i < 8; i++){
            pos1.y += 80;
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"Black"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"Black"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y += 80;
            pos2.x += 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"black.png"].CGImage;
            test.name = @"Black";
        }
    } else{
        for(int i = 1; i < 8; i++){
            pos1.y += 80;
            pos1.x += 80;
            test = [self.view.layer hitTest:pos1];
            if([test.name isEqualToString:@"Math"] || [test.name isEqualToString:@"self"]){
                return;
            }
            if(i == 1){
                if([test.name isEqualToString:@"White"]){
                    return;
                }
            } else{
                if([test.name isEqualToString:@"White"]){
                    a = i;
                    break;
                }
            }
        }
        for(int i = 1; i < a; i++){
            pos2.y += 80;
            pos2.x += 80;
            test = [self.view.layer hitTest:pos2];
            test.contents = (id)[UIImage imageNamed:@"white.png"].CGImage;
            test.name = @"White";
        }
    }
}

-(BOOL)all:(CGPoint)pos{
    BOOL B1 = [self top:pos];
    BOOL B2 = [self left:pos];
    BOOL B3 = [self right:pos];
    BOOL B4 = [self bottom:pos];
    BOOL B5 = [self top_left:pos];
    BOOL B6 = [self top_right:pos];
    BOOL B7 = [self bottom_left:pos];
    BOOL B8 = [self bottom_right:pos];
    BOOL YN;
    if(B1 == YES || B2 == YES || B3 == YES || B4 == YES || B5 == YES || B6 == YES || B7 == YES || B8 == YES){
        YN = YES;
    } else{
        YN = NO;
    }
    return YN;
}

-(void)all2:(CGPoint)pos{
    [self chenge_top:pos];
    [self chenge_left:pos];
    [self chenge_right:pos];
    [self chenge_bottom:pos];
    [self chenge_bottom_left:pos];
    [self chenge_bottom_right:pos];
    [self chenge_top_left:pos];
    [self chenge_top_right:pos];
}

-(void)T{
    if(BW == YES){
        label.text = @"黒";
    } else {
        label.text = @"白";
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint pos = [[touches anyObject]locationInView:self.view];
    CALayer *test = [self.view.layer hitTest:pos];
    pos = test.position;
    BOOL B = [self all:pos];
    if(B == YES){
        CALayer *test = [self.view.layer hitTest:pos];
        if(![test.name isEqualToString:@"Math"]){
            return;
        }
        if(BW == YES){
            test.contents = (id)[UIImage imageNamed:@"black.png"].CGImage;
            test.name = @"Black";
            [self all2:pos];
            BW = NO;
        } else{
            test.contents = (id)[UIImage imageNamed:@"white.png"].CGImage;
            test.name = @"White";
            [self all2:pos];
            BW = YES;
        }
        [self T];
    }
}
-(IBAction)path{
    if(BW == YES){
        BW = NO;
    } else{
        BW = YES;
    }
    [self T];
}
/*-(BOOL)check:(CGPoint)pos type:(NSString *)type{
    int e = 0;
    CGPoint pos1;
    if([type isEqualToString:@"Black"]){
        pos1 = pos;
        pos1.x += 80;
        CALayer *test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"White"]){
            e++;
        }
        pos1.y += 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"White"]){
            e++;
        }
        pos1.x -= 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"White"]){
            e++;
        }
        pos1.x -= 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"White"]){
            e++;
        }
        pos1.y -= 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"White"]){
            e++;
        }
        pos1.y -= 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"White"]){
            e++;
        }
        pos1.x += 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"White"]){
            e++;
        }
        pos1.x += 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"White"]){
            e++;
        }
    } else{
        pos1 = pos;
        pos1.x += 80;
        CALayer *test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"Black"]){
            e++;
        }
        pos1.y += 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"Black"]){
            e++;
        }
        pos1.x -= 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"Black"]){
            e++;
        }
        pos1.x -= 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"Black"]){
            e++;
        }
        pos1.y -= 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"Black"]){
            e++;
        }
        pos1.y -= 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"Black"]){
            e++;
        }
        pos1.x += 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"Black"]){
            e++;
        }
        pos1.x += 80;
        test = [self.view.layer hitTest:pos1];
        if(![test.name isEqualToString:@"Black"]){
            e++;
        }
    }
    if(e == 0){
        return YES;
    } else{
        return NO;
    }
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.layer.name = @"self";
    for(int i = 0; i < 8; i++){
        for(int j = 0; j < 8; j++){
            CALayer *math = [CALayer layer];
            math.contents = (id)[UIImage imageNamed:@"Math.png"].CGImage;
            math.bounds = CGRectMake(0, 0, 80, 80);
            math.position = CGPointMake(100 + 80 * i, 100 + 80 * j);
            math.name = @"Math";
            [self.view.layer addSublayer:math];
        }
    }
    
    CGPoint pos = CGPointMake(320, 400);
    CALayer *test = [self.view.layer hitTest:pos];
    test.contents = (id)[UIImage imageNamed:@"black.png"].CGImage;
    test.name = @"Black";
    pos = CGPointMake(320, 320);
    test = [self.view.layer hitTest:pos];
    test.contents = (id)[UIImage imageNamed:@"white.png"].CGImage;
    test.name = @"White";
    pos = CGPointMake(400, 320);
    test = [self.view.layer hitTest:pos];
    test.contents = (id)[UIImage imageNamed:@"black.png"].CGImage;
    test.name = @"Black";
    pos = CGPointMake(400, 400);
    test = [self.view.layer hitTest:pos];
    test.contents = (id)[UIImage imageNamed:@"white.png"].CGImage;
    test.name = @"White";
    BW = YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [label release];
    [super dealloc];
}
@end
