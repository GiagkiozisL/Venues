
#import "DTMainViewController.h"
#import "DTSideMenuViewController.h"
#import "ControlVariables.h"

static NSString *const kTableViewCellIdentifier = @"com.exploretraditionalgreece";

@interface DTMainViewController ()

@end

@implementation DTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Main View Controller";
    self.view.backgroundColor = [UIColor grayColor];
    
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithTitle:@"Hamburger" style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    self.navigationItem.leftBarButtonItem = openItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellIdentifier];
}

- (void)openButtonPressed {
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifier forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [NSString stringWithFormat:@"giouxouuuuu  %i",indexPath.row + 1];
}

@end
