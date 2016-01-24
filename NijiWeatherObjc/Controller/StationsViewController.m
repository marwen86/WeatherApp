//
//  StationsViewControllerViewController.m
//  NijiWeatherObjc
//
//  Created by Mohamed Marouane YOUSSEF on 21/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

#import "StationsViewController.h"
#import "NWAAppManager.h"
#import "WeatherTableViewCell.h"
#import "NWAStation.h"

@interface StationsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong) NSArray *listOfStations;
@end

@implementation StationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.listOfStations =[[NSArray alloc] init];
    [self loadSstationsForCitie:self.nWACity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)loadSstationsForCitie:(NWACity *)city
{
    [[NWAAppManager sharedManager] loadAllStationsForCity:city Completion:^(NSArray *array, NSError *error) {
        self.listOfStations = [NSArray arrayWithArray:array];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listOfStations count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"WeatherTableViewCell";
    
    
    
    WeatherTableViewCell *cell = (WeatherTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = (WeatherTableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.name.text=[(NWAStation *)[self.listOfStations objectAtIndex:indexPath.row] name];
    cell.humidity.text=[NSString stringWithFormat:@"%@",[(NWAStation *)[self.listOfStations objectAtIndex:indexPath.row] humidity]];
     cell.temp.text=[NSString stringWithFormat:@"%@",[(NWAStation *)[self.listOfStations objectAtIndex:indexPath.row] temp]];
     cell.speed.text=[NSString stringWithFormat:@"%@",[(NWAStation *)[self.listOfStations objectAtIndex:indexPath.row] pressure]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 110.0f;
}

@end
