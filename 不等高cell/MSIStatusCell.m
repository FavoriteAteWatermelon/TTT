//
//  MSIStatusCell.m
//  不等高cell
//
//  Created by s on 2020/7/21.
//  Copyright © 2020 s. All rights reserved.
//

#import "MSIStatusCell.h"
#import "MSIStatus.h"

#define MSILabelFont [UIFont systemFontOfSize:16]
#define MSITextFont [UIFont systemFontOfSize:14]
@interface MSIStatusCell()
//@property (nonatomic,weak)UILabel *titleLabel;
@property (nonatomic,weak)UIImageView *iconImageView;
@property (nonatomic,weak)UILabel *nameLabel;
@property (nonatomic,weak)UILabel *text_Label;
@property (nonatomic,weak)UIImageView *vipImageView;
@property (nonatomic,weak)UIImageView *pictureImageView;
@end

@implementation MSIStatusCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
//        图像
        UIImageView *iconImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.backgroundColor = [UIColor redColor];
        nameLabel.font=MSILabelFont;
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *text_Label = [[UILabel alloc]init];
        text_Label.numberOfLines = 0;
        text_Label.backgroundColor= [UIColor greenColor];
        text_Label.font = MSITextFont;
        [self.contentView addSubview:text_Label];
        self.text_Label = text_Label;
        
        UIImageView *vipImageView = [[UIImageView alloc]init];
         
          [self.contentView addSubview:vipImageView];
          self.vipImageView = vipImageView;
          
        
        UIImageView *pictureImageView = [[UIImageView alloc]init];
          [self.contentView addSubview:pictureImageView];
          self.pictureImageView = pictureImageView;
        
        
        
    }
    return self;
}

//设置大小
- (void)layoutSubviews {
    [super layoutSubviews];
//    图像
    CGFloat space = 10;
    CGFloat iconX = space;
    CGFloat iconY  = space;
    CGFloat iconWH = 40;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
//    昵称
    CGFloat nameX = CGRectGetMaxX(self.iconImageView.frame) + space;
    CGFloat nameY = iconY;
    NSDictionary *nameAttr = @{NSFontAttributeName:MSILabelFont};
    CGSize nameSize =  [self.status.name sizeWithAttributes:nameAttr];
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
//    vip
    if (self.status.isVip) {
        NSLog(@"ddd");
        CGFloat vipWH = 14;
        CGFloat vipX = CGRectGetMaxX(self.nameLabel.frame) + space;
        CGFloat vipY = nameY + (nameH - vipWH) * 0.5;
        self.vipImageView.frame = CGRectMake(vipX, vipY, vipWH, vipWH);
    }
    
//    正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxX(self.iconImageView.frame)+ space;
    CGFloat textW = CGRectGetWidth(self.contentView.frame) - 2 * space;
    NSDictionary *textAttr = @{NSFontAttributeName:MSITextFont};
    CGSize tSize = CGSizeMake(textW, MAXFLOAT);
//    CGFloat textH = [self.status.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:tSize].height;
    CGFloat textH = [self.status.text  boundingRectWithSize:tSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttr context:nil ].size.height;
    self.text_Label.frame = CGRectMake(textX, textY, textW, textH);
//计算正文文字的高度
    
//    配图
    if(self.status.picture) {
        CGFloat pictureX = iconX;
        CGFloat pictureY = self.text_Label.frame.origin.y + space + self.text_Label.frame.size.height;
        CGFloat pictrueHW = 100;
        self.pictureImageView.frame = CGRectMake(pictureX, pictureY, pictrueHW, pictrueHW);
    }
//    self.status.text
    
    //    CGFloat textH =
    
    //    CGFloat nameW =
}

//设置数据
-(void)setStatus:(MSIStatus *)status{
//    NSLog(@"ddd");
    _status = status;
    self.iconImageView.image=[ UIImage imageNamed:status.icon];
    self.nameLabel.text = status.name;
    self.vipImageView.image =[UIImage imageNamed:@"vip"];
    if(status.isVip){
        self.vipImageView.hidden = NO;
       
        self.nameLabel.textColor = [UIColor orangeColor];
       
    }else{
        self.vipImageView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    self.text_Label.text = status.text;
    self.pictureImageView.image = [UIImage imageNamed:status.picture];
    if (status.picture){
        
        self.pictureImageView.hidden = NO;
        
    }else {
        self.pictureImageView.hidden= YES;
    }
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
