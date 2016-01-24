//
//  StationsViewControllerViewController.h
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NWACity.h"

@interface StationsViewController : UIViewController<UITableViewDelegate>

@property(nonatomic,strong) NWACity *nWACity;

@end
