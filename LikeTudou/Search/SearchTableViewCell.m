//
//  SearchTableViewCell.m
//  LikeTudou
//
//  Created by gdm on 13-7-18.
//  Copyright (c) 2013年 龚道明. All rights reserved.
//

#import "SearchTableViewCell.h"

@implementation SearchTableViewCell

- (void)dealloc
{
    [_imgView release];
    [_playTimeLabel release];
    [_typeLabel release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        float height = self.frame.size.height-10;
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 55, 70)];
        [self.contentView addSubview:_imgView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 225, 30)];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.lineBreakMode = NSLineBreakByClipping;
        _nameLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_nameLabel];
        
        UILabel * aTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 35, 32, 20)];
        aTypeLabel.textAlignment = NSTextAlignmentLeft;
        aTypeLabel.text = @"类型:";
        aTypeLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:aTypeLabel];
        [aTypeLabel release];
        
        
        _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(102, 35, 40, 20)];
        _typeLabel.textAlignment = NSTextAlignmentLeft;
        _typeLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_typeLabel];
        
        
        UILabel * aPlayCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 55, 45, 20)];
        aPlayCountLabel.textAlignment = NSTextAlignmentLeft;
        aPlayCountLabel.text = @"播放量:";
        aPlayCountLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:aPlayCountLabel];
        [aPlayCountLabel release];
        
        _playTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 55, 60, 20)];
        _playTimeLabel.textAlignment = NSTextAlignmentLeft;
        _playTimeLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_playTimeLabel];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareContentView
{
    
}

@end
