//
//  OLBasicRequest.m
//  WebConnectPrj
//
//  Created by Apple on 14-10-9.
//  Copyright (c) 2014年 zhangchaoqun. All rights reserved.
//

#import "OLBasicRequest.h"
#import "WebConstant.h"

@interface OLBasicRequest()
@property (nonatomic,retain) NSString * requestUrlStr;
@end

@implementation OLBasicRequest
-(id)responseCheckForWebData:(id)data{
    return nil;
}
-(id)init
{
    self = [self initWithRequestIdStr:@"1"];
    if (self) {
        
    }
    return self;
}
-(id)initWithRequestIdStr:(NSString *)str
{
    self = [super initWithRequestIdStr:str];
    self.urlType = OL_Connection_URL_Type_COMMON;
    
    return self;
}


-(NSString *)requestUrlStr
{
    NSString * str = [super requestUrlStr];
    if (str)//当str有内容时
    {
        return str;
    }
    
    switch (_urlType)
    {
        case OL_Connection_URL_Type_NONE:
            str = [NSString stringWithFormat:@"%@/%@",DEFAULT_HTTP_SERVER_HOST,DEFAULT_HTTP_SERVER_PATH];
            break;
        case OL_Connection_URL_Type_COMMON:
            str = @"http://hzp.onlylady.com/index.php?c=Iapp";
            break;
        case OL_Connection_URL_Type_CMS:
            str = @"http://m.onlylady.com/blog/?from=IOS";
//            str = [NSString stringWithFormat:@"%@/%@",DEFAULT_HTTP_SERVER_HOST,DEFAULT_HTTP_SERVER_PATH];
            break;
        case OL_Connection_URL_Type_PRODUCT:
            str = @"http://hzp.onlylady.com/index.php?c=Iapp";
//            str = [NSString stringWithFormat:@"%@/%@",PRODUCT_HTTP_SERVER_HOST,PRODUCT_HTTP_SERVER_PATH];
            break;
        case OL_Connection_URL_Type_BLOG:
            str = @"http://m.onlylady.com/blog/?from=IOS";
            //            str = [NSString stringWithFormat:@"%@/%@",DEFAULT_HTTP_SERVER_HOST,DEFAULT_HTTP_SERVER_PATH];
            break;

        default:
            break;
    }
    return str;
}



@end
