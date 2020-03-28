//
//  VAURLFile.h
//  SDArtWorldCloud
//
//  Created by metis on 2020/3/28.
//  Copyright © 2020 Sudo. All rights reserved.
//

#ifndef VAURLFile_h
#define VAURLFile_h

#define VAHeaderResquest @"https://www.sundocloud.com/api/v1/"
#define KUserLogin [NSString stringWithFormat:@"%@%@",VAHeaderResquest,@"login"] //手机号登录
#define KSendSMS [NSString stringWithFormat:@"%@%@",VAHeaderResquest,@"captcha/sms"] //发送验证码
#endif /* VAURLFile_h */
