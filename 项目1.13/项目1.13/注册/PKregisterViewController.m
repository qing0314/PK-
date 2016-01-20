//
//  PKregisterViewController.m
//  项目1.13
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 LQ. All rights reserved.
//

#import "PKregisterViewController.h"
#import "PKLoginView.h"
@interface PKregisterViewController ()<UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) UIButton *backBtn;
@property (strong, nonatomic) UIButton *headBtn;
@property (copy, nonatomic) NSString *imageFiled;
@property (strong, nonatomic) PKLoginView *loginView;

@end

@implementation PKregisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headBtn];
    [self.view addSubview:self.backBtn];
    [self.view addSubview:self.loginView];
    
    WS(weakSelf)
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(470);
    }];
    
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(30, 27));
        make.top.equalTo(weakSelf.view.mas_top).offset(30);
        make.left.equalTo(weakSelf.view.mas_left).offset(20);
    }];
    [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(80, 80));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.top.equalTo(weakSelf.view.mas_top).offset(60);
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (PKLoginView *)loginView
{
    if (!_loginView) {
        _loginView = [[PKLoginView alloc]init ];//WithFrame:CGRectMake(0, 0, 0, 0)];
        _loginView.userNameText.delegate = self;
        _loginView.emailText.delegate = self;
        _loginView.passwordText.delegate = self;
        [_loginView.finishBtn addTarget:self action:@selector(loginHttpRequest) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginView;
}

- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(dismissToPKLeftMenuViewCtl) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (UIButton *)headBtn
{
    if (!_headBtn) {
        _headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headBtn.layer.cornerRadius = 40;
        _headBtn.layer.masksToBounds = 40;

        [_headBtn setImage:[UIImage imageNamed:@"上传头像"] forState:UIControlStateNormal];
        [_headBtn addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headBtn;
}


- (void)loginHttpRequest{
    //点击完成的时候隐藏键盘
    [self disMissKeyboard];
    //判断用户名是否为空，isEmptyString方法是NSString + helper中的
    if ([_loginView.userNameText.text isEmptyString]) {
        [self.view makeToast:@"用户名不能为空" duration:1 position:@"center"];
    }
    //判断密码是否为空，isEmptyString方法是NSString + helper中的
    else if ([_loginView.passwordText.text isEmptyString]){
        [self.view makeToast:@"密码不能为空" duration:1 position:@"center"];
    }
    //判断邮箱是否为空，isEmptyString方法是NSString + helper中的
    else if ([_loginView.emailText.text isEmptyString]){
        [self.view makeToast:@"邮箱不能为空" duration:1 position:@"center"];
    }
    //判断头像是否为空，isEmptyString方法是NSString + helper中的
    else if ([_headBtn.currentImage isEqual:[UIImage imageNamed:@"上传头像"]]){
        [self.view makeToast:@"头像不能为空" duration:1 position:@"center"];
    }
    else{
        //开始进行网络请求，上传头像到服务器
        WS(weakSelf);
        [JPRefreshView showJPRefreshFromView:self.view];
        [ZJPBaseHttpTool postImagePath:@"http://api2.pianke.me/user/reg" params:[self makeLoginRequestDic] image:_imageFiled success:^(id JSON) {
            NSDictionary *returnDic = JSON;
            //判断是否成功，如果result为 1 ，注册成功，result为0，查看返回字典中data字段中msg的错误原因
            if ([returnDic[@"result"] integerValue] == 1) {
                //成功后的提示框，方法在 UIView+Toast 中，第一个参数是提示的内容，第二个是显示时间，第三个是显示位置，一共有三z个
                [weakSelf.view makeToast:@"注册成功" duration:1 position:@"center"];
            }else{
                [weakSelf.view makeToast:[returnDic[@"data"] valueForKey:@"msg"] duration:1 position:@"center"];
            }
            [JPRefreshView removeJPRefreshFromView:self.view];
        } failure:^(NSError *error) {
            [weakSelf.view makeToast:@"注册失败" duration:1 position:@"center"];
            [JPRefreshView removeJPRefreshFromView:self.view];
        }];
    }
}
//制作请求参数
- (NSDictionary *)makeLoginRequestDic{
    NSDictionary *dic = @{@"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":_loginView.emailText.text,
                          @"gender":@"1",
                          @"passwd":_loginView.passwordText.text,
                          @"uname":_loginView.userNameText.text,
                          @"version":@"3.0.6",
                          @"auth":@"",
                          @"iconfile":_imageFiled};
    return dic;
}


#pragma mark 提示框方法
- (void)selectImage:(UIButton *)btn;
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册中选择", nil];
    actionSheet.destructiveButtonIndex = -1;//设置那一个显示红色文字提示
    [actionSheet showInView:self.view];
}
//actionSheet的代理方法，每一个buttonindex的点击事件
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //相机拍照
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }else if (buttonIndex == 1){
        //相册选择
        UIImagePickerController *imagePicker=[[UIImagePickerController alloc] init];
        imagePicker.delegate=self;
        imagePicker.allowsEditing=YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

//UIImagePickerController的代理方法，选择好照片后会调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获得图片
    UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    //获取沙盒目录
    NSString *homePath = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
//    NSLog(@"------------%@",homePath);
    //将图片名字拼接到路径后面
    NSString *imageViews   = [homePath stringByAppendingFormat:@"/%d.png", arc4random_uniform(1000000)];
    //将图片写入沙盒
    [UIImageJPEGRepresentation(editedImage, 1.0f) writeToFile:imageViews atomically:YES];
    //将图片路径保存下来，因为在上传图片的时候会用到
    self.imageFiled = imageViews;
    //更新imageBtn的图片
    [_headBtn setImage:editedImage forState:(UIControlStateNormal)];
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissToPKLeftMenuViewCtl
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 键盘上移
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    WS(weakSelf)
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 130.0;
            weakSelf.view.bounds = rect;
        }];
        return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_loginView.userNameText resignFirstResponder];
    [_loginView.emailText resignFirstResponder];
    [_loginView.passwordText resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_loginView.userNameText resignFirstResponder];
    [_loginView.emailText resignFirstResponder];
    [_loginView.passwordText resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
}
//隐藏键盘的方法
- (void)disMissKeyboard{
    [_loginView.emailText resignFirstResponder];
    [_loginView.passwordText resignFirstResponder];
    [_loginView.userNameText resignFirstResponder];
}

@end
