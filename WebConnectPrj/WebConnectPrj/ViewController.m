//
//  ViewController.m
//  WebConnectPrj
//
//  Created by Apple on 14-10-9.
//  Copyright (c) 2014年 zhangchaoqun. All rights reserved.
//

#import "ViewController.h"
#import "NTConnectClient.h"
#import "NTBasicRequest.h"

#import "OLConfigRequest.h"
#import "OLProtocolRequest.h"
#import "OLNameListTableView.h"

#import "OLConfigDataModel.h"

#import "OLBasicListTableView.h"
#import "OLMainTopicListViewController.h"
#import "NTConnectSepcialClient.h"
#import "AFHTTPRequestOperationManager.h"
#import "JSWebView.h"
#import "OLEGOCustomListTableView.h"
#import "OLBasicListTableView.h"
@interface ViewController (){
    OLEGOCustomListTableView * nameList;
    
    
    dispatch_queue_t queue1;
    dispatch_queue_t queue2;
}
@property (nonatomic,assign) NSInteger foo;
@property (nonatomic,assign) NSInteger bar;
@end

@implementation ViewController
@synthesize foo;
@synthesize bar;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    queue1 = dispatch_queue_create("com.viewcontroller.queue1", DISPATCH_QUEUE_CONCURRENT);
    queue2 = dispatch_queue_create("com.viewcontroller.queue2", NULL);
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(tapedOnTestBtn:) forControlEvents:UIControlEventTouchUpInside];
    

    //计算block运行时间，私有api，测试使用
    uint64_t dispatch_benchmark(size_t count, void (^block)(void));
    size_t const objectCount = 1000;
    uint64_t n = dispatch_benchmark(10000, ^{
        @autoreleasepool {
            id obj = @42;
            NSMutableArray *array = [NSMutableArray array];
            for (size_t i = 0; i < objectCount; ++i) {
                [array addObject:obj];
            }
        }
    });
    NSLog(@"-[NSMutableArray addObject:] : %llu ns", n);
    
    
    UIView  *aView = nil;
    aView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 300, 80)];
    aView.backgroundColor = [UIColor blueColor];
    nameList = [[OLBasicListTableView alloc] initWithFrame:CGRectMake(0, 200, 300, 300)style:UITableViewStylePlain];
    nameList.contentInset = UIEdgeInsetsMake(80, 0, 0, 0);
    nameList.containPreContentInset = YES;
    
//    
    //1种情况
    [self.view addSubview:nameList];
//    [self.view addSubview:aView];
    nameList.headerViewAboveInset = NO;
    
    
    //2种情况
//    aView.frame = CGRectMake(0, -80, 300, 80);
//    [self.view addSubview:nameList];
//    [nameList addSubview:aView];
//    nameList.headerViewAboveInset = YES;
    
    OLNameListTableView * list = [[OLNameListTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    list.scrollsToTop = NO;
    
    __weak OLEGOCustomListTableView * weakSelf = nameList;
    
    nameList.loadRefreshNewDataBlock = ^(OLEGOCustomListTableView * table){
        NSLog(@"loadRefreshNewDataBlock");

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf reloadData];
               [weakSelf doneLoadDataReloading];
        });
    };
    nameList.loadMoreDataBlock = ^(OLEGOCustomListTableView * table){
        NSLog(@"loadMoreDataBlock");
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            static int number = 0;
            number++;
            if (number%10!=0) {
                [weakSelf reloadData];
                [weakSelf doneLoadDataReloading];
                return ;
            }
            [weakSelf doneLoadDataReloadingAndEndLoadMoreWithString:@"暂无更多数据"];
        });
    };
    
    [self.view addSubview:list];
    
    nameList.dataSource = list;
//    [nameList startRefreshDataInForcedWithViewAnimated:YES];

    
//    
//    dispatch_group_t group = dispatch_group_create();
//    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    dispatch_group_async(group, queue, ^(){
//        // Do something that takes a while
////        [self doSomeFoo];
//        dispatch_group_async(group, dispatch_get_main_queue(), ^(){
//            self.foo = 42;
//        });
//    });
//    dispatch_group_async(group,queue, ^(){
//        // Do something else that takes a while
////        [self doSomeBar];
//        dispatch_group_async(group, dispatch_get_main_queue(), ^(){
//            
//            self.bar = 1;
//        });
//    });
//    
//    // This block will run once everything above is done:
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^(){
//        NSLog(@"foo: %d", self.foo); 
//        NSLog(@"bar: %d", self.bar); 
//    });
    
}
+(void)showLogStart:(int)number
{
    for (int i=0;i<10000 ;i++ )
    {
        NSLog(@"showLogStart %d",i+number);
    }
}

-(void)tapedOnTestBtn:(id)sender
{
//    nameList.loadMoreType++;
//    
//    return;
//    [nameList reloadData];

    ///异步打印
//    dispatch_async(queue2,^(){
//        [[self class] showLogStart:100];
//    });
//    
//    NSLog(@"dispatch_async finish");
//    
//     
//    dispatch_sync(queue2,^(){
//        [[self class] showLogStart:20000];
//    });
//    
//    NSLog(@"dispatch_sync finish");
//    
//    
//    return;
//    NSURLResponse *
//    [[NSURLCache sharedURLCache] setMemoryCapacity:1*1024*1024];
//
//    
//    NSString * str = @"http://olshow.onlylady.com/index.php?c=LookAPI&a=Default&rd=20&pm=2&se=0&sre=1&sud=12428402&ud=12428402";
//    static int num = 0;
//    num++;
//    if (num%2==0)
//    {
//        
//        NTBasicRequest * request = [[NTBasicRequest alloc] init];
//        request.requestUrlStr = str;
//        
//        [[NTConnectClient sharedNTConnectClient] requestWithBasicRequest:request andEndBlock:^(id responseData, NSError *error) {
//            NSLog(@"sharedNTConnectClient cache %@",responseData);
//        }];
//        return;
//    }
//    
//    str = @"http://olshow.onlylady.com/index.php?c=LookAPI&a=Default&rd=20&pm=1&se=0&sre=1&sud=12428402&ud=12428402";
//    NTBasicRequest * request2 = [[NTBasicRequest alloc] init];
//    request2.requestUrlStr = str;
//    
//    [[NTConnectClient sharedNTConnectClient] requestWithBasicRequest:request2 andEndBlock:^(id responseData, NSError *error) {
//        NSLog(@"sharedNTConnectClient first %@",responseData);
//    }];
////    return;
//    str = @"http://olshow.onlylady.com/index.php?c=LookAPI&a=Default&rd=20&pm=2&se=0&sre=1&sud=12428402&ud=12428402";
//    request2.requestUrlStr = str;
//    
//    [[NTConnectClient sharedNTConnectClient] requestWithBasicRequest:request2 andEndBlock:^(id responseData, NSError *error) {
//        NSLog(@"sharedNTConnectClient second %@",responseData);
//    }];
//    return;
//    OLMainTopicListViewController * ol = [[OLMainTopicListViewController alloc] init];
//    [self presentViewController:ol animated:YES completion:nil];
    
//    OLBasicRequest * aRequest = [[OLBasicRequest alloc] initWithRequestIdStr:@"200"];
//    aRequest.requestUrlStr = @"http://www.456ri.com/html/article/index14923.html";
//    [[NTConnectSepcialClient sharedNTConnectSepcialClient] specialRequestWithBasicRequest:aRequest
//                                                                              andEndBlock:^(id responseData, NSError *error) {
//                                                                                  NSLog(@"%@",responseData);
//                                                                              }];


    
//    nameList.loadMoreType = nameList.loadMoreType+1;
//    [nameList startLoadMoredDataInForcedWithViewAnimated:YES];
    AFHTTPRequestOperationManager * manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString * urlstr = @"http://www.456ri.com/html/article/index14923.html";
    
    JSWebView * aWeb = [[JSWebView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:aWeb];
    aWeb.endJSOperationBlcok = ^(NSArray *arr){
        
    };
    
    [manager GET:urlstr
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSString *textFile = operation.responseString;
             if (!textFile)
             {
                 NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
                 textFile  = [[NSString alloc] initWithData:responseObject encoding:enc];
             }
             
             NSLog(@"responseObject%@ %@",operation.responseString,textFile);
             [aWeb loadWebHtml:textFile];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"responseObject%@",error);
         }];
    

    
    return;
    //普通请求
    OLConfigRequest * arequest = [[OLConfigRequest alloc] init];
    [[NTConnectClient sharedNTConnectClient] requestWithBasicRequest:arequest
                                                         andEndBlock:^(id responseData, NSError *error) {
                                                             NSLog(@"%@ %@",responseData,error);
                                                         }];
    
    
    
    
    
    //需要结果处理的大量数据请求
    OLProtocolRequest * request = [[OLProtocolRequest alloc] init];
    [[NTConnectClient sharedNTConnectClient] requestWithBasicRequest:request
                                                         andEndBlock:^(id responseData, NSError *error) {
                                                             
                                                             
                                                             
                                                         }];
    
    
    [[NTConnectClient sharedNTConnectClient] requestModelDataArrayWithBasicRequest:request
                                                                checkResponseBlock:^NSArray *(id responseData) {
                                                                    NSDictionary * dic = [responseData valueForKey:@"de"];

                                                                    NSLog(@"allKeys %@",[dic allKeys]);
                                                                    return [dic allKeys];
                                                                } andEndBlock:^(BOOL netWorkType, NSArray *array) {
                                                                    NSLog(@"netWorkType %d %@",netWorkType,array);
                                                                }];
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
     NSLog(@"observeValueForKeyPathobserveValueForKeyPath ");
//    NSLog(@"%@ %@ %@",keyPath,object,nameList.dataArr);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
