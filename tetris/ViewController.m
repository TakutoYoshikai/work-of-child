//
//  ViewController.m
//  テトリス
//
//  Created by 拓人 吉開 on 12/02/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@implementation ViewController

-(void)del:(CALayer *)layer{
        CGPoint pos = layer.position;
        CGPoint pos2 = pos;
        pos2.x += 40;
        CALayer *test2 = [self.view.layer hitTest:pos2];
        int i = 0;
        while ([test2.name hasPrefix:@"B"]) {
            i++;
            pos2.x += 40;
            test2 = [self.view.layer hitTest:pos2];
        }
        pos2 = pos;
        pos2.x -= 40;
        test2 = [self.view.layer hitTest:pos2];
        while ([test2.name hasPrefix:@"B"]) {
            i++;
            pos2.x -= 40;
            test2 = [self.view.layer hitTest:pos2];
        }
    if(i == 7){
        for(int j = 0; j < 8; j++){
            CALayer *test3 = [[self.view.layer hitTest:CGPointMake(20 + 40 * j, pos.y)]retain];
            [test3 removeFromSuperlayer];
            [test3 release];
        }
        int e = (pos.y - 20) / 40;
        for(int k = e; k >= 0; k--){
            for(int n = 0; n < 8; n++){
                test2 = [self.view.layer hitTest:CGPointMake(20 + 40 * n, 20 + 40 * k)];
                if([test2.name hasPrefix:@"B"]){
                    CGPoint pos3 = test2.position;
                    pos3.y += 40;
                    test2.position = pos3;
                }
            }
        }
    }
    
}
-(void)left{
    if(r == 0){
        CGPoint pos = layer1.position;
        pos.x -= 40;
        CALayer *test = [self.view.layer hitTest:pos];
        if([test.name hasPrefix:@"B"] || pos.x <= 0){
            return;
        }
        layer1.position = pos;
    } else if(r == 1){
        CGPoint pos = layer1.position;
        CGPoint pos2 = layer2.position;
        pos.x -= 40;
        pos2.x -= 40;
        CALayer *test = [self.view.layer hitTest:pos];
        CALayer *test2 = [self.view.layer hitTest:pos2];
        if([test.name hasPrefix:@"B"] || [test2.name hasPrefix:@"B"]|| pos.x <= 0 || pos2.x <= 0){
            return;
        }
        layer1.position = pos;
        layer2.position = pos2;
    } else if(r == 2){
        CGPoint pos = layer1.position;
        CGPoint pos2 = layer2.position;
        CGPoint pos3 = layer3.position;
        pos.x -= 40;
        pos2.x -= 40;
        pos3.x -= 40;
        CALayer *test = [self.view.layer hitTest:pos];
        CALayer *test2 = [self.view.layer hitTest:pos2];
        CALayer *test3 = [self.view.layer hitTest:pos3];
        if([test.name hasPrefix:@"B"] || [test2.name hasPrefix:@"B"] || [test3.name hasPrefix:@"B"] || pos.x <= 0 || pos2.x <= 0 || pos3.x <= 0){
            return;
        }
        layer1.position = pos;
        layer2.position = pos2;
        layer3.position = pos3;
    } else if(r == 3){
        CGPoint pos = layer1.position;
        CGPoint pos2 = layer2.position;
        CGPoint pos3 = layer3.position;
        CGPoint pos4 = layer4.position;
        pos.x -= 40;
        pos2.x -= 40;
        pos3.x -= 40;
        pos4.x -= 40;
        CALayer *test2 = [self.view.layer hitTest:pos];
        CALayer *test3 = [self.view.layer hitTest:pos4];
        if([test2.name hasPrefix:@"B"] || [test3.name hasPrefix:@"B"] || pos.x <= 0){
            return;
        }
        layer1.position = pos;
        layer2.position = pos2;
        layer3.position = pos3;
        layer4.position = pos4;
    }
}

-(void)right{
    if(r == 0){
        CGPoint pos = layer1.position;
        pos.x += 40;
        CALayer *test = [self.view.layer hitTest:pos];
        if([test.name hasPrefix:@"B"] || pos.x >= 320){
            return;
        }
        layer1.position = pos;
    } else if(r == 1){
        CGPoint pos = layer1.position;
        CGPoint pos2 = layer2.position;
        pos.x += 40;
        pos2.x += 40;
        CALayer *test = [self.view.layer hitTest:pos];
        CALayer *test2 = [self.view.layer hitTest:pos2];
        if([test.name hasPrefix:@"B"] || [test2.name hasPrefix:@"B"]|| pos2.x >= 320 || pos.x >= 320){
            return;
        }
        layer1.position = pos;
        layer2.position = pos2;
    } else if(r == 2){
        CGPoint pos = layer1.position;
        CGPoint pos2 = layer2.position;
        CGPoint pos3 = layer3.position;
        pos.x += 40;
        pos2.x += 40;
        pos3.x += 40;
        CALayer *test = [self.view.layer hitTest:pos];
        CALayer *test2 = [self.view.layer hitTest:pos2];
        CALayer *test3 = [self.view.layer hitTest:pos3];
        if([test.name hasPrefix:@"B"] || [test2.name hasPrefix:@"B"] || [test3.name hasPrefix:@"B"] || pos.x >= 320 || pos2.x >= 320 || pos3.x >= 320){
            return;
        }
        layer1.position = pos;
        layer2.position = pos2;
        layer3.position = pos3;
    } else if(r == 3){
        CGPoint pos = layer1.position;
        CGPoint pos2 = layer2.position;
        CGPoint pos3 = layer3.position;
        CGPoint pos4 = layer4.position;
        pos.x += 40;
        pos2.x += 40;
        pos3.x += 40;
        pos4.x += 40;
        CALayer *test2 = [self.view.layer hitTest:pos2];
        CALayer *test3 = [self.view.layer hitTest:pos3];
        if([test2.name hasPrefix:@"B"] || [test3.name hasPrefix:@"B"] || pos2.x >= 320){
            return;
        }
        layer1.position = pos;
        layer2.position = pos2;
        layer3.position = pos3;
        layer4.position = pos4;
    }
}
-(void)touche{
    if(r == 1){
        CGPoint pos = layer1.position;
        CGPoint pos2 = layer2.position;
        if(katati == 0){
            pos.y += 40;
            pos2.x -= 40;
            CALayer *test = [self.view.layer hitTest:pos];
            if(pos.y >= 480 || [test.name hasPrefix:@"B"]){
                return;
            }
            katati = 1;
            layer1.position = pos;
            layer2.position = pos2;
        } else if(katati == 1){
            pos.x += 40;
            pos2.y += 40;
            CALayer *test = [self.view.layer hitTest:pos];
            if(pos.y >= 480 || [test.name hasPrefix:@"B"] || pos.x >= 320){
                return;
            }
            katati = 2;
            layer1.position = pos;
            layer2.position = pos2;
        } else if(katati == 2){
            pos.y -= 40;
            pos2.x += 40;
            CALayer *test = [self.view.layer hitTest:pos];
            if(pos.y >= 480 || [test.name hasPrefix:@"B"]){
                return;
            }
            katati = 3;
            layer1.position = pos;
            layer2.position = pos2;
        } else if(katati == 3){
            pos.x -= 40;
            pos2.y -= 40;
            CALayer *test = [self.view.layer hitTest:pos];
            if(pos.y >= 480 || [test.name hasPrefix:@"B"] || pos.x <= 0){
                return;
            }
            katati = 0;
            layer1.position = pos;
            layer2.position = pos2;

        }
    } else if(r == 2){
        CGPoint pos = layer1.position;
        CGPoint pos2 = layer2.position;
        CGPoint pos3 = layer3.position;
        if(katati == 0){
            pos.x += 40;
            pos2.y += 40;
            pos3.x -= 40;
            CALayer *test3 = [self.view.layer hitTest:pos3];
            if(pos2.y >= 480 || [test3.name hasPrefix:@"B"]){
                return;
            }
            katati = 1;
        } else if(katati == 1){
            pos.y += 40;
            pos2.x -= 40;
            pos3.y -= 40;
            CALayer *test3 = [self.view.layer hitTest:pos3];
            if(pos2.y >= 480 || [test3.name hasPrefix:@"B"]){
                return;
            }
            katati = 2;
        } else if(katati == 2){
            pos.x -= 40;
            pos2.y -= 40;
            pos3.x += 40;
            CALayer *test3 = [self.view.layer hitTest:pos3];
            if(pos.y >= 480 || [test3.name hasPrefix:@"B"]){
                return;
            }
            katati = 3;
        } else if(katati == 3){
            pos.y -= 40;
            pos2.x += 40;
            pos3.y += 40;
            CALayer *test3 = [self.view.layer hitTest:pos3];
            if(pos3.y >= 480 || [test3.name hasPrefix:@"B"]){
                return;
            }
            katati = 0;
        }
        layer1.position = pos;
        layer2.position = pos2;
        layer3.position = pos3;
    } 
}
-(void)ranEQcol{
    blockType = arc4random() % 3;
    switch (blockType) {
        case 0:
            type = @"red";
            break;
        case 1:
            type = @"blue";
            break;
        case 2:
            type = @"yellow";
        default:
            break;
    }
}


-(void)block2:(CGPoint)pos{
    //blockType = arc4random() % 3;
    if(r == 0){
        [self ranEQcol];
        CALayer *block1 = [CALayer layer];
        NSString *name = [NSString stringWithFormat:@"%@.JPG", type];
        block1.name = [NSString stringWithFormat:@"R_%@", type];
        block1.contents = (id)[UIImage imageNamed:name].CGImage;
        block1.bounds = CGRectMake(0, 0, 40, 40);
        block1.position = pos;
        layer1 = block1;
        [self.view.layer addSublayer:block1];
    } else if(r == 1){
        CALayer *block1 = [CALayer layer];
        [self ranEQcol];
        NSString *name = [NSString stringWithFormat:@"%@.JPG", type];
        block1.name = [NSString stringWithFormat:@"R_%@", type];
        block1.contents = (id)[UIImage imageNamed:name].CGImage;
        block1.bounds = CGRectMake(0, 0, 40, 40);
        block1.position = pos;
        CALayer *block2 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block2.name = [NSString stringWithFormat:@"R_%@", type];
        block2.contents = (id)[UIImage imageNamed:name].CGImage;
        block2.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos2 = CGPointMake(pos.x + 40, pos.y);
        block2.position = pos2;
        layer1 = block1;
        layer2 = block2;
        [self.view.layer addSublayer:block1];
        [self.view.layer addSublayer:block2];
        katati = 0;
    } else if(r == 2){
        CALayer *block1 = [CALayer layer];
        [self ranEQcol];
        NSString *name = [NSString stringWithFormat:@"%@.JPG", type];
        block1.name = [NSString stringWithFormat:@"R_%@", type];
        block1.contents = (id)[UIImage imageNamed:name].CGImage;
        block1.bounds = CGRectMake(0, 0, 40, 40);
        block1.position = pos;
        CALayer *block2 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block2.name = [NSString stringWithFormat:@"R_%@", type];
        block2.contents = (id)[UIImage imageNamed:name].CGImage;
        block2.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos2 = CGPointMake(pos.x + 40, pos.y);
        block2.position = pos2;
        CALayer *block3 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block3.name = [NSString stringWithFormat:@"R_%@", type];
        block3.contents = (id)[UIImage imageNamed:name].CGImage;
        block3.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos3 = CGPointMake(pos2.x, pos2.y + 40);
        block3.position = pos3;
        layer1 = block1;
        layer2 = block2;
        layer3 = block3;
        [self.view.layer addSublayer:block1];
        [self.view.layer addSublayer:block2];
        [self.view.layer addSublayer:block3];
        katati = 0;
    } else if(r == 3){
        CALayer *block1 = [CALayer layer];
        [self ranEQcol];
        NSString *name = [NSString stringWithFormat:@"%@.JPG", type];
        block1.name = [NSString stringWithFormat:@"R_%@", type];
        block1.contents = (id)[UIImage imageNamed:name].CGImage;
        block1.bounds = CGRectMake(0, 0, 40, 40);
        block1.position = pos;
        CALayer *block2 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block2.name = [NSString stringWithFormat:@"R_%@", type];
        block2.contents = (id)[UIImage imageNamed:name].CGImage;
        block2.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos2 = CGPointMake(pos.x + 40, pos.y);
        block2.position = pos2;
        CALayer *block3 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block3.name = [NSString stringWithFormat:@"R_%@", type];
        block3.contents = (id)[UIImage imageNamed:name].CGImage;
        block3.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos3 = CGPointMake(pos2.x, pos2.y + 40);
        block3.position = pos3;
        CALayer *block4 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block4.name = [NSString stringWithFormat:@"R_%@", type];
        block4.contents = (id)[UIImage imageNamed:name].CGImage;
        block4.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos4 = CGPointMake(pos3.x - 40, pos3.y);
        block4.position = pos4;
        
        layer1 = block1;
        layer2 = block2;
        layer3 = block3;
        layer4 = block4;
        [self.view.layer addSublayer:block1];
        [self.view.layer addSublayer:block2];
        [self.view.layer addSublayer:block3];
        [self.view.layer addSublayer:block4];
    }
    timer = [NSTimer 
             scheduledTimerWithTimeInterval:1 target:self selector:@selector(rakka) userInfo:nil repeats:YES];
}
/*-(void)allDel{
    [label removeFromSuperview];
    label = nil;
    [label release];
    CALayer *test;
    [self.view removeGestureRecognizer:doubletap];
    for(int a = 0; a < 12; a++){
        for(int a2 = 0; a2 < 8; a2++){
            test = [self.view.layer hitTest:CGPointMake(20 + 40 * a2, 20 + 40 * a)];
            if([test.name hasPrefix:@"B"]){
                [test removeFromSuperlayer];
            }
        }
    }
    CGPoint pos1;
    random = arc4random() % 7;
    pos1 = CGPointMake(20 + 40 * random, 0);
    YN = NO;
    [self block2:pos1];
}
-(void)gameover{
    label = [[UILabel alloc]initWithFrame:CGRectMake(160, 240, 100, 90)];
    label.text = @"GAMEOVER";
    [self.view addSubview:label];
    doubletap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(allDel)];
    doubletap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubletap];
}

-(void)end:(CGPoint)pos{
    if(YN == YES){
        return;
    }
    CALayer *test = [self.view.layer hitTest:pos];
    if([test.name hasPrefix:@"B"]){
        //[timer invalidate];
        [test removeFromSuperlayer];
        [self gameover];
        YN = YES;
    }
}
*/

-(void)block1:(CGPoint)pos{
    if(r == 0){
        [self ranEQcol];
        CALayer *block1 = [CALayer layer];
        NSString *name = [NSString stringWithFormat:@"%@.JPG", type];
        block1.name = [NSString stringWithFormat:@"R_%@", type];
        block1.contents = (id)[UIImage imageNamed:name].CGImage;
        block1.bounds = CGRectMake(0, 0, 40, 40);
        block1.position = pos;
        layer1 = block1;
        //[self end:pos];
        if(YN == YES){
            return;
        }
        [self.view.layer addSublayer:block1];
    } else if(r == 1){
        CALayer *block1 = [CALayer layer];
        [self ranEQcol];
        NSString *name = [NSString stringWithFormat:@"%@.JPG", type];
        block1.name = [NSString stringWithFormat:@"R_%@", type];
        block1.contents = (id)[UIImage imageNamed:name].CGImage;
        block1.bounds = CGRectMake(0, 0, 40, 40);
        block1.position = pos;
        CALayer *block2 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block2.name = [NSString stringWithFormat:@"R_%@", type];
        block2.contents = (id)[UIImage imageNamed:name].CGImage;
        block2.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos2 = CGPointMake(pos.x + 40, pos.y);
        block2.position = pos2;
        layer1 = block1;
        layer2 = block2;
        //[self end:pos];
        //[self end:pos2];
        if(YN == YES){
            return;
        }
        [self.view.layer addSublayer:block1];
        [self.view.layer addSublayer:block2];
        katati = 0;
    } else if(r == 2){
        CALayer *block1 = [CALayer layer];
        [self ranEQcol];
        NSString *name = [NSString stringWithFormat:@"%@.JPG", type];
        block1.name = [NSString stringWithFormat:@"R_%@", type];
        block1.contents = (id)[UIImage imageNamed:name].CGImage;
        block1.bounds = CGRectMake(0, 0, 40, 40);
        block1.position = pos;
        CALayer *block2 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block2.name = [NSString stringWithFormat:@"R_%@", type];
        block2.contents = (id)[UIImage imageNamed:name].CGImage;
        block2.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos2 = CGPointMake(pos.x + 40, pos.y);
        block2.position = pos2;
        CALayer *block3 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block3.name = [NSString stringWithFormat:@"R_%@", type];
        block3.contents = (id)[UIImage imageNamed:name].CGImage;
        block3.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos3 = CGPointMake(pos2.x, pos2.y + 40);
        block3.position = pos3;
        layer1 = block1;
        layer2 = block2;
        layer3 = block3;
        //[self end:pos];
        //[self end:pos2];
        //[self end:pos3];
        if(YN == YES){
            return;
        }
        [self.view.layer addSublayer:block1];
        [self.view.layer addSublayer:block2];
        [self.view.layer addSublayer:block3];
        katati = 0;
    } else if(r == 3){
        CALayer *block1 = [CALayer layer];
        [self ranEQcol];
        NSString *name = [NSString stringWithFormat:@"%@.JPG", type];
        block1.name = [NSString stringWithFormat:@"R_%@", type];
        block1.contents = (id)[UIImage imageNamed:name].CGImage;
        block1.bounds = CGRectMake(0, 0, 40, 40);
        block1.position = pos;
        CALayer *block2 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block2.name = [NSString stringWithFormat:@"R_%@", type];
        block2.contents = (id)[UIImage imageNamed:name].CGImage;
        block2.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos2 = CGPointMake(pos.x + 40, pos.y);
        block2.position = pos2;
        CALayer *block3 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block3.name = [NSString stringWithFormat:@"R_%@", type];
        block3.contents = (id)[UIImage imageNamed:name].CGImage;
        block3.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos3 = CGPointMake(pos2.x, pos2.y + 40);
        block3.position = pos3;
        CALayer *block4 = [CALayer layer];
        [self ranEQcol];
        name = [NSString stringWithFormat:@"%@.JPG", type];
        block4.name = [NSString stringWithFormat:@"R_%@", type];
        block4.contents = (id)[UIImage imageNamed:name].CGImage;
        block4.bounds = CGRectMake(0, 0, 40, 40);
        CGPoint pos4 = CGPointMake(pos3.x - 40, pos3.y);
        block4.position = pos4;
        
        layer1 = block1;
        layer2 = block2;
        layer3 = block3;
        layer4 = block4;
        //[self end:pos];
        //[self end:pos2];
        //[self end:pos3];
        //[self end:pos4];
        if(YN == YES){
            return;
        }
        [self.view.layer addSublayer:block1];
        [self.view.layer addSublayer:block2];
        [self.view.layer addSublayer:block3];
        [self.view.layer addSublayer:block4];
    }
    timer = [NSTimer 
             scheduledTimerWithTimeInterval:1 target:self selector:@selector(rakka) userInfo:nil repeats:YES];
}
        

-(void)makeBlock:(CGPoint)pos{
    //r = arc4random() % 3;
    [self block1:pos];
}

-(void)rakka{
    if(r == 0){
    CGPoint pos1 = layer1.position;
    pos1.y = pos1.y + 40;
    CALayer *test = [self.view.layer hitTest:pos1];
    //NSRange rang = [test.name rangeOfString:@"B"];
    if(pos1.y >= 480 || [test.name hasPrefix:@"B"]){
        [timer invalidate];
        if(pos1.y <= 60){
            UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(160, 240, 100, 50)];
            label2.text = @"GameOver";
            [self.view addSubview:label2];
            return;
        }
        random = arc4random() % 7;
        pos1 = CGPointMake(20 + 40 * random, 0);
        layer1.name = [layer1.name stringByReplacingOccurrencesOfString:@"R" withString:@"B"];
        r = arc4random() % 4;
        [self del:layer1];
        [self block1:pos1];
        return;
    }
    layer1.position = pos1;
    } else if(r == 1){
        CGPoint pos1 = layer1.position;
        CGPoint pos2 = layer2.position;
        pos1.y += 40;
        pos2.y += 40;
        CALayer *test = [self.view.layer hitTest:pos1];
        CALayer *test2 = [self.view.layer hitTest:pos2];
        //NSRange rang = [test.name rangeOfString:@"B"];
        //NSRange rang2 = [test2.name rangeOfString:@"B"];
        if(pos1.y >= 480 || pos2.y >= 480 || [test.name hasPrefix:@"B"] || [test2.name hasPrefix:@"B"]){
            [timer invalidate];
            if(pos1.y <= 60){
                UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(160, 240, 100, 50)];
                label2.text = @"GameOver";
                [self.view addSubview:label2];
                return;
            }
            random = arc4random() % 7;
            pos1 = CGPointMake(20 + 40 * random, 0);
            layer1.name = [layer1.name stringByReplacingOccurrencesOfString:@"R" withString:@"B"];
            layer2.name = [layer2.name stringByReplacingOccurrencesOfString:@"R" withString:@"B"];
            r = arc4random() % 4;
            [self del:layer1];
            [self del:layer2];
            [self makeBlock:pos1];
            return;
        }
        layer1.position = pos1;
        layer2.position = pos2;
        
    } else if(r == 2){
        CGPoint pos1 = layer1.position;
        CGPoint pos2 = layer2.position;
        CGPoint pos3 = layer3.position;
        pos1.y += 40;
        pos2.y += 40;
        pos3.y += 40;
        CALayer *test = [self.view.layer hitTest:pos1];
        CALayer *test2 = [self.view.layer hitTest:pos2];
        CALayer *test3 = [self.view.layer hitTest:pos3];
        if(pos1.y >= 480 || pos3.y >= 480 || [test.name hasPrefix:@"B"] || [test2.name hasPrefix:@"B"] || [test3.name hasPrefix:@"B"]){
            [timer invalidate];
            if(pos1.y <= 60){
                UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(160, 240, 100, 50)];
                label2.text = @"GameOver";
                [self.view addSubview:label2];
                return;
            }
            random = arc4random() % 7;
            pos1 = CGPointMake(20 + 40 * random, 0);
            layer1.name = [layer1.name stringByReplacingOccurrencesOfString:@"R" withString:@"B"];
            layer2.name = [layer2.name stringByReplacingOccurrencesOfString:@"R" withString:@"B"];
            layer3.name = [layer3.name stringByReplacingOccurrencesOfString:@"R" withString:@"B"];
            r = arc4random() % 4;
            [self del:layer1];
            [self del:layer2];
            [self del:layer3];
            [self makeBlock:pos1];
            return;
        }
        layer1.position = pos1;
        layer2.position = pos2;
        layer3.position = pos3;
    } else if(r == 3){
        CGPoint pos1 = layer1.position;
        CGPoint pos2 = layer2.position;
        CGPoint pos3 = layer3.position;
        CGPoint pos4 = layer4.position;
        pos1.y += 40;
        pos2.y += 40;
        pos3.y += 40;
        pos4.y += 40;
        CALayer *test3 = [self.view.layer hitTest:pos3];
        CALayer *test4 = [self.view.layer hitTest:pos4];
        if(pos3.y >= 480 || [test3.name hasPrefix:@"B"] || [test4.name hasPrefix:@"B"]){
            [timer invalidate];
            if(pos1.y <= 60){
                UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(160, 240, 100, 50)];
                label2.text = @"GameOver";
                [self.view addSubview:label2];
                return;
            }
            random = arc4random() % 7;
            pos1 = CGPointMake(20 + 40 * random, 0);
            layer1.name = [layer1.name stringByReplacingOccurrencesOfString:@"R" withString:@"B"];
            layer2.name = [layer2.name stringByReplacingOccurrencesOfString:@"R" withString:@"B"];
            layer3.name = [layer3.name stringByReplacingOccurrencesOfString:@"R" withString:@"B"];
            layer4.name = [layer4.name stringByReplacingOccurrencesOfString:@"R" withString:@"B"];
            r = arc4random() % 4;
            [self del:layer1];
            [self del:layer2];
            [self del:layer3];
            [self del:layer4];
            [self makeBlock:pos1];
            return;
        }
        layer1.position = pos1;
        layer2.position = pos2;
        layer3.position = pos3;
        layer4.position = pos4;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touche)];
    [self.view addGestureRecognizer:tap];
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(left)];
    left.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:left];
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(right)];
    [self.view addGestureRecognizer:right];
    random = arc4random() % 7;
    CGPoint pos = CGPointMake(20 + 40 * random, 0);
    r = arc4random() % 4;
    YN = NO;
    [self makeBlock:pos];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
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
    [super dealloc];
}
@end
