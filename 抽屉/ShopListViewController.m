//
//  ShopListViewController.m
//  抽屉
//
//  Created by 高山峰 on 15/10/26.
//  Copyright © 2015年 高山峰. All rights reserved.
//

#import "ShopListViewController.h"
#import "SubModel.h"
#import <MessageUI/MessageUI.h>
@interface ShopListViewController ()<MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ShopListViewController

-(void)loadView{
 
    CGRect frame = [UIScreen mainScreen].bounds;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 200) style:UITableViewStylePlain];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shopList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        SubModel *model = self.shopList[indexPath.row];
        cell.textLabel.text = model.name;
        cell.imageView.image = [UIImage imageNamed:model.imageName];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
//        UIApplication *app = [UIApplication sharedApplication];
//        NSURL *url = [NSURL URLWithString:@"telprompt://15001136980"];
//        [app openURL:url];
        /** 这是打电话 */
        if (_webView == nil) {
            _webView = [[UIWebView alloc]initWithFrame:CGRectZero];
        }
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"tel://15001136980"]]];
    }else if (indexPath.row == 1){
        if(![MFMessageComposeViewController canSendText])return;
        MFMessageComposeViewController *VC = [[MFMessageComposeViewController alloc]init];
        //设置短信内容
        VC.body = @"叮叮,我是永远永远爱你的峰";
        //设置收件人列表
        VC.recipients = @[@"18310393005"];
        //设置代理
        VC.messageComposeDelegate = self;
        //显示控制器
        [self presentViewController:VC animated:YES completion:nil];
    }else if(indexPath.row == 2){
        if (![MFMailComposeViewController canSendMail])return;
        MFMailComposeViewController *vc = [[MFMailComposeViewController alloc]init];
        
        //设置邮件主题
        [vc setSubject:@"会议"];
        //设置邮件内容
        [vc setMessageBody:@"今天下午开会吧" isHTML:NO];
        //设置收件人列表
        [vc setToRecipients:@[@"749958343@qq.com"]];
        //设置抄送人列表
        [vc setCcRecipients:@[@"1234@qq.com"]];
        //设置密送人列表
        [vc setBccRecipients:@[@"5678@qq.com"]];
        
        
        //添加附件(一张图片)
        UIImage *image = [UIImage imageNamed:@""];
        NSData *data = UIImageJPEGRepresentation(image, 0.5);
        [vc addAttachmentData:data mimeType:@"image/jpg" fileName:@"baseBoss.jpg"];
        
        //设置代理
        vc.mailComposeDelegate = self;
        //显示控制器
        [self presentViewController:vc animated:YES completion:nil];
    }
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [self dismissViewControllerAnimated:YES completion:nil];
    if (MessageComposeResultCancelled == result) {
        NSLog(@"取消发送");
    }else if (MessageComposeResultSent == result){
        NSLog(@"发送成功");
    }else if (MessageComposeResultFailed == result){
        NSLog(@"发送失败");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0){
    [self dismissViewControllerAnimated:YES completion:nil];
    if(MFMailComposeResultCancelled == result){
        NSLog(@"取消发送");
    }else if (MFMailComposeResultSent == result){
        NSLog(@"发送成功");
    }else if (MFMailComposeResultSaved == result){
        NSLog(@"保存成功");
    }else if (MFMailComposeResultFailed == result){
        NSLog(@"发送失败");
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
