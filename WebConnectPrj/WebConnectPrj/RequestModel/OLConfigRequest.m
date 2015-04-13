//
//  OLConfigRequest.m
//  WebConnectPrj
//
//  Created by Apple on 14-10-9.
//  Copyright (c) 2014年 zhangchaoqun. All rights reserved.
//

#import "OLConfigRequest.h"

@implementation OLConfigRequest

-(id)init
{
    self = [super initWithRequestIdStr:@"81"];
    self.pageIndex = 1;
    return self;
}

//实现相应的方法，以便作为服务器接收key值
-(void)setPageIndex:(NSInteger)pageIndex
{
    _pageIndex = pageIndex;
    [self setObject:[NSNumber numberWithLong:pageIndex] forKey:@"num"];
}



@end
