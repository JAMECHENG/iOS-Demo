//
//  MaintenanceModel.h
//  LovingCar
//
//  Created by Jame on 15/8/10.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "BaseModel.h"

@interface MaintenanceModel : BaseModel
/**
 @abstract
 **/
@property (nonatomic, copy) NSString *carId;
/**
 @abstract
 **/
@property (nonatomic, copy) NSString *maintenanceId;
/**
 @abstract 保养的时间
 **/
@property (nonatomic, copy) NSDate *maintenanceDate;

@end
