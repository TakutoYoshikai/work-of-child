//
//  MainViewController.m
//  将棋
//
//  Created by 拓人 吉開 on 12/02/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "MainViewController.h"
#import "ComaLayer.h"
@implementation MainViewController
@synthesize label;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


-(BOOL)check:(CGPoint)pos coma:(ComaLayer *)coma1{
    ComaLayer *test = [self.view.layer hitTest:pos];
    if(coma1.player == 0){
        return NO;
    } else if(coma1.player == 1){
        if(coma1.type == 0){
            if(coma1.position.y == 100 + 80 * 6){
                if(pos.x == coma1.position.x && pos.y == coma1.position.y - 80 * 2){
                    CGPoint pos1 = CGPointMake(coma1.position.x, coma1.position.y - 80 * 1);
                    ComaLayer *testcoma = [self.view.layer hitTest:pos1];
                    if(testcoma.player != 0){
                        return NO;
                    }
                    if(test.player == 0){
                        coma1.position = pos;
                        return NO;
                    } else {
                        return NO;
                    }
                } 
            }
            if(pos.x == coma1.position.x && pos.y == coma1.position.y - 80){
                if(test.player == 0){
                    coma1.position = pos;
                    if(coma1.position.y == 100 + 80 * 0){
                        coma1.contents = (id)[UIImage imageNamed:@"WQ.png"].CGImage;
                        coma1.type = 4;
                    }
                    return NO;
                } else {
                    return NO;
                }
            } else if(pos.x == coma1.position.x + 80 && pos.y == coma1.position.y - 80){
                if(test.player == 1){
                    return NO;
                } else if(test.player == 2){
                    coma1.position = pos;
                    if(coma1.position.y == 100 + 80 * 0){
                        coma1.contents = (id)[UIImage imageNamed:@"WQ.png"].CGImage;
                        coma1.type = 4;
                    }
                    return YES;
                } else{
                    CGPoint testpos = CGPointMake(coma1.position.x + 80, coma1.position.y);
                    ComaLayer *testP = [self.view.layer hitTest:testpos];
                    if(testP.player == 2 && testP.type == 0 && testP.count == 1 && coma1.position.y == 100 + 80 * 3){
                        coma1.position = pos;
                        [testP removeFromSuperlayer];
                        return NO;
                    }
                }
            } else if(pos.x == coma1.position.x - 80 && pos.y == coma1.position.y - 80){
                if(test.player == 1){
                    return NO;
                } else if(test.player == 2){
                    coma1.position = pos;
                    if(coma1.position.y == 100 + 80 * 0){
                        coma1.contents = (id)[UIImage imageNamed:@"WQ.png"].CGImage;
                        coma1.type = 4;
                    }
                    return YES;
                } else{
                    CGPoint testpos = CGPointMake(coma1.position.x - 80, coma1.position.y);
                    ComaLayer *testP = [self.view.layer hitTest:testpos];
                    if(testP.player == 2 && testP.type == 0 && testP.count == 1 && coma1.position.y == 100 + 80 * 3){
                        coma1.position = pos;
                        [testP removeFromSuperlayer];
                        return NO;
                    }
                }
            }
        } else if(coma1.type == 1){
            ComaLayer *King = [self.view.layer hitTest:pos];
            CGPoint tmppos1 = CGPointMake(80 + 80 * 5, 100 + 80 * 7);
            CGPoint tmppos2 = CGPointMake(80 + 80 * 6, 100 + 80 * 7);
            ComaLayer *tmp1 = [self.view.layer hitTest:tmppos1];
            ComaLayer *tmp2 = [self.view.layer hitTest:tmppos2];
            if(pos.x == 80 + 80 * 4 && pos.y == 100 + 80 * 7 && King.player == 1 && King.type == 5 && tmp1.player == 0 && tmp2.player == 0 && coma1.position.x == 80 + 80 * 7 && coma1.position.y == 100 + 80 * 7){
                //CGPoint tmp3 = King.position;
                if(King.count > 0 || coma1.count > 0){
                    return NO;
                }
                King.position = CGPointMake(King.position.x + 80 * 2, King.position.y);
                coma1.position = CGPointMake(coma1.position.x - 80 * 2, coma1.position.y);
                return NO;
            }
            int t;
            if(pos.y < coma1.position.y && pos.x == coma1.position.x){
                t = 0;
            } else if(pos.y > coma1.position.y && pos.x == coma1.position.x){
                t = 1;
            } else if(pos.y == coma1.position.y && pos.x < coma1.position.x){
                t = 2;
            } else if(pos.y == coma1.position.y && pos.x > coma1.position.x){
                t = 3;
            }
            for(int i = 1; i < 9; i++){
                if(t == 0){
                    CGPoint pos2 = CGPointMake(coma1.position.x, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x == pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        return NO;
                    }
                } else if(t == 1){
                    CGPoint pos2 = CGPointMake(coma1.position.x, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x == pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        return NO;
                    }
                } else if(t == 2){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y == pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test.player == 1){
                            return NO;
                        } else {
                            coma1.position = pos;
                            return NO;
                        }
                        return NO;
                    }
                } else if(t == 3){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y == pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        return NO;
                    }
                }
            }
            return NO;
        } else if(coma1.type == 2){
            if(pos.y == coma1.position.y - 160 && pos.x ==coma1.position.x + 80){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 1){
                    return NO;
                } else if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y - 160 && pos.x == coma1.position.x - 80){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 1){
                    return NO;
                } else if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y - 80 && pos.x == coma1.position.x + 160){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 1){
                    return NO;
                } else if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y - 80 && pos.x == coma1.position.x - 160){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 1){
                    return NO;
                } else if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y + 80 && pos.x == coma1.position.x + 160){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 1){
                    return NO;
                } else if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y + 80 && pos.x == coma1.position.x - 160){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 1){
                    return NO;
                } else if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y + 160 && pos.x == coma1.position.x + 80){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 1){
                    return NO;
                } else if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y + 160 && pos.x == coma1.position.x - 80){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 1){
                    return NO;
                } else if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                }
            }
        } else if(coma1.type == 3){
            int t;
            if(pos.y < coma1.position.y && pos.x < coma1.position.x){
                t = 0;
            } else if(pos.y > coma1.position.y && pos.x > coma1.position.x){
                t = 1;
            } else if(pos.y > coma1.position.y && pos.x < coma1.position.x){
                t = 2;
            } else if(pos.y < coma1.position.y && pos.x > coma1.position.x){
                t = 3;
            }
            for(int i = 1; i < 9; i++){
                if(t == 0){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 1){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 2){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 3){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } 
            }
            return NO;
        } else if(coma1.type == 4){
            int t;
            if(pos.y < coma1.position.y && pos.x < coma1.position.x){
                t = 0;
            } else if(pos.y > coma1.position.y && pos.x > coma1.position.x){
                t = 1;
            } else if(pos.y > coma1.position.y && pos.x < coma1.position.x){
                t = 2;
            } else if(pos.y < coma1.position.y && pos.x > coma1.position.x){
                t = 3;
            } else if(pos.y < coma1.position.y && pos.x == coma1.position.x){
                t = 4;
            } else if(pos.y > coma1.position.y && pos.x == coma1.position.x){
                t = 5;
            } else if(pos.y == coma1.position.y && pos.x < coma1.position.x){
                t = 6;
            } else if(pos.y == coma1.position.y && pos.x > coma1.position.x){
                t = 7;
            }
            for(int i = 1; i < 9; i++){
                if(t == 0){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 1){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else {
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 2){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 3){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 4){
                    CGPoint pos2 = CGPointMake(coma1.position.x, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x == pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 5){
                    CGPoint pos2 = CGPointMake(coma1.position.x, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x == pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 6){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y == pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 7){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y == pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 2){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 1){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                }
            }
        } else if(coma1.type == 5){
            if(pos.y == coma1.position.y - 80 && pos.x == coma1.position.x){
                if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 1){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y - 80 && pos.x == coma1.position.x + 80){
                if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 1){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y && pos.x == coma1.position.x + 80){
                if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 1){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y + 80 && pos.x == coma1.position.x + 80){
                if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 1){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y + 80 && pos.x == coma1.position.x){
                if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 1){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y + 80 && pos.x == coma1.position.x - 80){
                if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 1){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y && pos.x == coma1.position.x - 80){
                if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 1){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y - 80 && pos.x == coma1.position.x - 80){
                if(test.player == 2){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 1){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            }
        }
    } else if(coma1.player == 2){
        if(coma1.type == 0){
            if(coma1.position.y == 100 + 80 * 1){
                if(pos.x == coma1.position.x && pos.y == coma1.position.y + 80 * 2){
                    CGPoint pos1 = CGPointMake(coma1.position.x, coma1.position.y + 80 * 1);
                    ComaLayer *testcoma = [self.view.layer hitTest:pos1];
                    if(testcoma.player != 0){
                        return NO;
                    }
                    if(test.player == 0){
                        coma1.position = pos;
                        return NO;
                    } else {
                        return NO;
                    }
                } 
            }
            if(pos.x == coma1.position.x && pos.y == coma1.position.y + 80){
                if(test.player == 0){
                    coma1.position = pos;
                    if(coma1.position.y == 100 + 80 * 7){
                        coma1.contents = (id)[UIImage imageNamed:@"BQ.png"].CGImage;
                        coma1.type = 4;
                    }
                    return NO;
                } else {
                    return NO;
                }
            } else if(pos.x == coma1.position.x + 80 && pos.y == coma1.position.y + 80){
                if(test.player == 2){
                    return NO;
                } else if(test.player == 1){
                    coma1.position = pos;
                    if(coma1.position.y == 100 + 80 * 7){
                        coma1.contents = (id)[UIImage imageNamed:@"BQ.png"].CGImage;
                        coma1.type = 4;
                    }
                    return YES;
                } else{
                    CGPoint testpos = CGPointMake(coma1.position.x + 80, coma1.position.y);
                    ComaLayer *testP = [self.view.layer hitTest:testpos];
                    if(testP.player == 1 && testP.type == 0 && testP.count == 1 && coma1.position.y == 100 + 80 * 4){
                        coma1.position = pos;
                        [testP removeFromSuperlayer];
                        return NO;
                    }
                }
            } else if(pos.x == coma1.position.x - 80 && pos.y == coma1.position.y + 80){
                if(test.player == 2){
                    return NO;
                } else if(test.player == 1){
                    coma1.position = pos;
                    if(coma1.position.y == 100 + 80 * 7){
                        coma1.contents = (id)[UIImage imageNamed:@"BQ.png"].CGImage;
                        coma1.type = 4;
                    }
                    return YES;
                } else{
                    CGPoint testpos = CGPointMake(coma1.position.x - 80, coma1.position.y);
                    ComaLayer *testP = [self.view.layer hitTest:testpos];
                    if(testP.player == 1 && testP.type == 0 && testP.count == 1 && coma1.position.y == 100 + 80 * 4){
                        coma1.position = pos;
                        [testP removeFromSuperlayer];
                        return NO;
                    }
                }
            }
        } else if(coma1.type == 1){
            ComaLayer *King = [self.view.layer hitTest:pos];
            CGPoint tmppos1 = CGPointMake(80 + 80 * 5, 100 + 80 * 0);
            CGPoint tmppos2 = CGPointMake(80 + 80 * 6, 100 + 80 * 0);
            ComaLayer *tmp1 = [self.view.layer hitTest:tmppos1];
            ComaLayer *tmp2 = [self.view.layer hitTest:tmppos2];
            if(pos.x == 80 + 80 * 4 && pos.y == 100 + 80 * 0 && King.player == 2 && King.type == 5 && tmp1.player == 0 && tmp2.player == 0 && coma1.position.x == 80 + 80 * 7 && coma1.position.y == 100){
                if(King.count > 0 || coma1.count > 0){
                    return NO;
                }
                King.position = CGPointMake(King.position.x + 80 * 2, King.position.y);
                coma1.position = CGPointMake(coma1.position.x - 80 * 2, coma1.position.y);
                return NO;
            }
            int t;
            if(pos.y < coma1.position.y && pos.x == coma1.position.x){
                t = 0;
            } else if(pos.y > coma1.position.y && pos.x == coma1.position.x){
                t = 1;
            } else if(pos.y == coma1.position.y && pos.x < coma1.position.x){
                t = 2;
            } else if(pos.y == coma1.position.y && pos.x > coma1.position.x){
                t = 3;
            }
            for(int i = 1; i < 9; i++){
                if(t == 0){
                    CGPoint pos2 = CGPointMake(coma1.position.x, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x == pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                        }
                        return NO;
                    }
                } else if(t == 1){
                    CGPoint pos2 = CGPointMake(coma1.position.x, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x == pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        return NO;
                    }
                } else if(t == 2){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y == pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test.player == 2){
                            return NO;
                        } else {
                            coma1.position = pos;
                            return NO;
                        }
                        return NO;
                    }
                } else if(t == 3){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y == pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        return NO;
                    }
                }
            }
            return NO;
        } else if(coma1.type == 2){
            if(pos.y == coma1.position.y - 160 && pos.x ==coma1.position.x + 80){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 2){
                    return NO;
                } else if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y - 160 && pos.x == coma1.position.x - 80){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 2){
                    return NO;
                } else if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y - 80 && pos.x == coma1.position.x + 160){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 2){
                    return NO;
                } else if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y - 80 && pos.x == coma1.position.x - 160){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 2){
                    return NO;
                } else if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y + 80 && pos.x == coma1.position.x + 160){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 2){
                    return NO;
                } else if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y + 80 && pos.x == coma1.position.x - 160){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 2){
                    return NO;
                } else if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y + 160 && pos.x == coma1.position.x + 80){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 2){
                    return NO;
                } else if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                }
            } else if(pos.y == coma1.position.y + 160 && pos.x == coma1.position.x - 80){
                if(test.player == 0){
                    coma1.position = pos;
                    return NO;
                } else if(test.player == 2){
                    return NO;
                } else if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                }
            }
        } else if(coma1.type == 3){
            int t;
            if(pos.y < coma1.position.y && pos.x < coma1.position.x){
                t = 0;
            } else if(pos.y > coma1.position.y && pos.x > coma1.position.x){
                t = 1;
            } else if(pos.y > coma1.position.y && pos.x < coma1.position.x){
                t = 2;
            } else if(pos.y < coma1.position.y && pos.x > coma1.position.x){
                t = 3;
            }
            for(int i = 1; i < 9; i++){
                if(t == 0){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 1){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 2){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 3){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } 
            }
            return NO;
        } else if(coma1.type == 4){
            int t;
            if(pos.y < coma1.position.y && pos.x < coma1.position.x){
                t = 0;
            } else if(pos.y > coma1.position.y && pos.x > coma1.position.x){
                t = 1;
            } else if(pos.y > coma1.position.y && pos.x < coma1.position.x){
                t = 2;
            } else if(pos.y < coma1.position.y && pos.x > coma1.position.x){
                t = 3;
            } else if(pos.y < coma1.position.y && pos.x == coma1.position.x){
                t = 4;
            } else if(pos.y > coma1.position.y && pos.x == coma1.position.x){
                t = 5;
            } else if(pos.y == coma1.position.y && pos.x < coma1.position.x){
                t = 6;
            } else if(pos.y == coma1.position.y && pos.x > coma1.position.x){
                t = 7;
            }
            for(int i = 1; i < 9; i++){
                if(t == 0){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 1){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else {
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 2){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 3){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 4){
                    CGPoint pos2 = CGPointMake(coma1.position.x, coma1.position.y - 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y > pos.y && pos2.x == pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 5){
                    CGPoint pos2 = CGPointMake(coma1.position.x, coma1.position.y + 80 * i);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y < pos.y && pos2.x == pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 6){
                    CGPoint pos2 = CGPointMake(coma1.position.x - 80 * i, coma1.position.y);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y == pos.y && pos2.x > pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                } else if(t == 7){
                    CGPoint pos2 = CGPointMake(coma1.position.x + 80 * i, coma1.position.y);
                    ComaLayer *test2 = [self.view.layer hitTest:pos2];
                    if(pos2.y == pos.y && pos2.x < pos.x){
                        if(test2.player != 0){
                            return NO;
                        }
                    } else if(pos2.y == pos.y && pos2.x == pos.x){
                        //coma1.position = pos;
                        if(test2.player == 1){
                            coma1.position = pos;
                            return YES;
                        } else if(test2.player == 2){
                            return NO;
                        } else{
                            coma1.position = pos;
                            return NO;
                        }
                        coma1.position = pos;
                        return NO;
                    }
                }
            }
        } else if(coma1.type == 5){
            if(pos.y == coma1.position.y - 80 && pos.x == coma1.position.x){
                if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 2){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y - 80 && pos.x == coma1.position.x + 80){
                if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 2){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y && pos.x == coma1.position.x + 80){
                if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 2){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y + 80 && pos.x == coma1.position.x + 80){
                if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 2){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y + 80 && pos.x == coma1.position.x){
                if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 2){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y + 80 && pos.x == coma1.position.x - 80){
                if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 2){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y && pos.x == coma1.position.x - 80){
                if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 2){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            } else if(pos.y == coma1.position.y - 80 && pos.x == coma1.position.x - 80){
                if(test.player == 1){
                    coma1.position = pos;
                    return YES;
                } else if(test.player == 2){
                    return NO;
                } else{
                    coma1.position = pos;
                    return NO;
                }
            }
        }
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint pos = [[touches anyObject]locationInView:self.view];
    pos.y += 20;
    ComaLayer *test = [self.view.layer hitTest:pos];
    //NSLog(@"%d", test.count);
    //ComaLayer *test = [self.view.layer hitTest:[[touches anyObject]locationInView:self.view]];
    //CGPoint posXY1 = test.position;
    CALayer *testself = [self.view.layer hitTest:[[touches anyObject]locationInView:self.view]];
    if([testself.name isEqualToString:@"self"]){
        return;
    }
    if(YN == YES){
        if(test.position.x == coma.position.x && test.position.y == coma.position.y){
            return;
        }
        CGPoint posXY1 = coma.position;
        BOOL b = [self check:test.position coma:coma];
        if(b == YES){
            if(test.player == 1 && test.type == 5){
                label.text = @"黒の勝ち";
            } else if(test.player == 2 && test.type == 5){
                label.text = @"白の勝ち";
            }
            [test removeFromSuperlayer];
        }
        CGPoint posXY2 = coma.position;
        if(posXY1.x == posXY2.x && posXY1.y == posXY2.y){
            if(Player == YES){
                Player = YES;
            } else{
                Player = NO;
            }
            return;
        }
        coma.count += 1;
        YN = NO;
    } else{
        if(Player == YES){
            if(test.player == 1){
                coma = test;
            } else{
                return;
            }
            Player = NO;
        } else if(Player == NO){
            if(test.player == 2){
                coma = test;
            } else{
                return;
            }
            Player = YES;
        }
        YN = YES;
    }
}
-(void)naraberu:(NSString *)type posi:(CGPoint)pos1 type2:(int)type2 pla:(int)pla{
    ComaLayer *coma1 = [ComaLayer layer];
    coma1.type = type2;
    coma1.player = pla;
    coma1.count = 0;
    coma1.bounds = CGRectMake(0, 0, 80, 80);
    coma1.contents = (id)[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", type]].CGImage;
    coma1.position = pos1;
    [self.view.layer addSublayer:coma1];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.layer.name = @"self";
    YN = NO;
    Player = YES;
    for(int i = 0; i < 8; i++){
        for(int j = 0; j < 8; j++){
            ComaLayer *cm = [ComaLayer layer];
            cm.bounds = CGRectMake(0, 0, 80, 80);
            cm.contents = (id)[UIImage imageNamed:@"math2.png"].CGImage;
            cm.position = CGPointMake(80 + 80 * i, 100 + 80 * j);
            cm.name = @"nil";
            cm.player = 0;
            [self.view.layer addSublayer:cm];
            
        }
    }
    for(int i = 0; i < 8; i++){
        ComaLayer *coma1 = [ComaLayer layer];
        coma1.type = 0;
        coma1.player = 1;
        coma1.bounds = CGRectMake(0, 0, 80, 80);
        coma1.contents = (id)[UIImage imageNamed:@"WBo.png"].CGImage;
        coma1.position = CGPointMake(80 + 80 * i, 100 + 80 * 6);
        //coma1.name = @"King";
        [self.view.layer addSublayer:coma1];
    }
    for(int i = 0; i < 8; i++){
        ComaLayer *coma1 = [ComaLayer layer];
        coma1.type = 0;
        coma1.player = 2;
        coma1.bounds = CGRectMake(0, 0, 80, 80);
        coma1.contents = (id)[UIImage imageNamed:@"BBo.png"].CGImage;
        coma1.position = CGPointMake(80 + 80 * i, 100 + 80 * 1);
        //coma1.name = @"King";
        [self.view.layer addSublayer:coma1];
    }
    CGPoint pos = CGPointMake(80 + 80 * 0, 100 + 80 * 0);
    [self naraberu:@"BR" posi:pos type2:1 pla:2];
    pos = CGPointMake(80 + 80 * 7, 100 + 80 * 0);
    [self naraberu:@"BR" posi:pos type2:1 pla:2];
    pos = CGPointMake(80 + 80 * 1, 100 + 80 * 0);
    [self naraberu:@"BN" posi:pos type2:2 pla:2];
    pos = CGPointMake(80 + 80 * 6, 100 + 80 * 0);
    [self naraberu:@"BN" posi:pos type2:2 pla:2];
    pos = CGPointMake(80 + 80 * 2, 100 + 80 * 0);
    [self naraberu:@"BB" posi:pos type2:3 pla:2];
    pos = CGPointMake(80 + 80 * 5, 100 + 80 * 0);
    [self naraberu:@"BB" posi:pos type2:3 pla:2];
    pos = CGPointMake(80 + 80 * 3, 100 + 80 * 0);
    [self naraberu:@"BQ" posi:pos type2:4 pla:2];
    pos = CGPointMake(80 + 80 * 4, 100 + 80 * 0);
    [self naraberu:@"BK" posi:pos type2:5 pla:2];
    
    pos = CGPointMake(80 + 80 * 0, 100 + 80 * 7);
    [self naraberu:@"WR" posi:pos type2:1 pla:1];
    pos = CGPointMake(80 + 80 * 7, 100 + 80 * 7);
    [self naraberu:@"WR" posi:pos type2:1 pla:1];
    pos = CGPointMake(80 + 80 * 1, 100 + 80 * 7);
    [self naraberu:@"WN" posi:pos type2:2 pla:1];
    pos = CGPointMake(80 + 80 * 6, 100 + 80 * 7);
    [self naraberu:@"WN" posi:pos type2:2 pla:1];
    pos = CGPointMake(80 + 80 * 2, 100 + 80 * 7);
    [self naraberu:@"WB" posi:pos type2:3 pla:1];
    pos = CGPointMake(80 + 80 * 5, 100 + 80 * 7);
    [self naraberu:@"WB" posi:pos type2:3 pla:1];
    pos = CGPointMake(80 + 80 * 3, 100 + 80 * 7);
    [self naraberu:@"WQ" posi:pos type2:4 pla:1];
    pos = CGPointMake(80 + 80 * 4, 100 + 80 * 7);
    [self naraberu:@"WK" posi:pos type2:5 pla:1];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)reset:(ComaLayer *)coma1{
    if(YN == YES){
        YN = NO;
        if(Player == YES){
            Player = NO;
        } else{
            Player = YES;
        }
    }
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

#pragma mark - Flipside View Controller


- (void)dealloc
{
    [label release];
    [super dealloc];
}


@end
