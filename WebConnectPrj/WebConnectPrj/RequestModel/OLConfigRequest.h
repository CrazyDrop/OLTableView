//
//  OLConfigRequest.h
//  WebConnectPrj
//
//  Created by Apple on 14-10-9.
//  Copyright (c) 2014年 zhangchaoqun. All rights reserved.
//

#import "OLBasicRequest.h"
//建议对于这种不需要参数，或者使用次数较少的不创建特定的对象

@interface OLConfigRequest : OLBasicRequest

@property (nonatomic,assign) NSInteger pageIndex;




@end
