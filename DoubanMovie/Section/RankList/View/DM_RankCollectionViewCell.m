//
//  DM_RankCollectionViewCell.m
//  DoubanMovie
//
//  Created by apppc on 15/3/19.
//  Copyright (c) 2015年 huatek. All rights reserved.
//

#import "DM_RankCollectionViewCell.h"

@implementation DM_RankCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imgRank = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.width/2, 45, 20, 20)];
        [self.contentView addSubview:self.imgRank];
        
        self.labTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.width/2 - 100, self.imgRank.bottom + 8, 200, 20)];
        self.labTitle.font = [UIFont systemFontOfSize:18];
        self.labTitle.textAlignment = NSTextAlignmentCenter;
        self.labTitle.textColor = mRGBColor(51, 174, 101);
        [self.contentView addSubview:self.labTitle];
        
        self.labDetail = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.width/2 - 100, self.labTitle.bottom + 8, 200, 20)];
        self.labDetail.font = [UIFont systemFontOfSize:14];
        self.labDetail.textAlignment = NSTextAlignmentCenter;
        self.labDetail.textColor = mRGBColor(45, 50, 54);
        [self.contentView addSubview:self.labDetail];
        
        UIView *lineRight = [[UIView alloc] initWithFrame:CGRectMake(self.contentView.width - 1, 0, 1, self.contentView.height)];
        lineRight.backgroundColor = mRGBColor(217, 217, 217);
        [self.contentView addSubview:lineRight];
        
        UIView *bottomRight = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentView.height - 1, self.contentView.width, 1)];
        bottomRight.backgroundColor = mRGBColor(217, 217, 217);
        [self.contentView addSubview:bottomRight];
    }
    return self;
}
@end
