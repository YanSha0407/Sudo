//
//  VAPictureCell.m
//  SDArtWorldCloud
//
//  Created by metis on 2019/12/5.
//  Copyright © 2019 Sudo. All rights reserved.
//

#import "VAPictureCell.h"

@interface VAPictureCell()
@property(nonatomic,strong)UIImageView *pictureView;
@end

@implementation VAPictureCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.pictureView];
    }
    return self;
}
-(UIImageView *)pictureView{
    if (!_pictureView) {
        _pictureView = [[UIImageView alloc]init];
        _pictureView.frame = self.bounds;
        _pictureView.contentMode = UIViewContentModeScaleAspectFill;
        _pictureView.backgroundColor = VAGrayUnUseColor;
        KClipsCornerRadius(_pictureView, 3);
    }
    return _pictureView;
}
//-(void)setPictureModel:(VAPictureModel *)pictureModel{
//    _pictureModel = pictureModel;
//    NSString *str = [NSString stringWithFormat:@"%@%@",self.pictureModel.image,self.pictureModel.size.image_thumb];
//    [self.pictureView setImageWithURL:VAURL(str) usingActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
//    
//}
@end
