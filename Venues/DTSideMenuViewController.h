
#import <UIKit/UIKit.h>

@class DTSideMenuViewController;

@interface DTSideMenuViewController : UIViewController

/** Time interval for opening and closing the side menu */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/** Is the menu currently open? */
@property (nonatomic, assign, getter = isOpen) BOOL open;

/** Offset to position the menu in open position */
@property (nonatomic, assign) UIOffset edgeOffset;

/** The scale for zooming the viewport. 0.0 to 1.0 */
@property (nonatomic, assign) CGFloat zoomScale;

/** The color of the shadow to display behind the scaled main view */
@property (nonatomic, strong) UIColor *shadowColor;

/** Left side menu view */
@property (nonatomic, strong) IBOutlet UIViewController *menuViewController;

/** Main View */
@property (nonatomic, strong) IBOutlet UIViewController *mainViewController;

/** When the menu is opened, a transparent button is displayed over the main view. This property gives the opportunity to modify it's accessibility label. */
@property (nonatomic, copy) NSString *closeOverlayAccessibilityLabel;

/** When the menu is opened, a transparent button is displayed over the main view. This property gives the opportunity to modify it's accessibility hint. */
@property (nonatomic, copy) NSString *closeOverlayAccessibilityHint;

/** Initializer that sets up a menuViewController and a mainViewController
 @param menuViewController The view controller to display in the left view
 @param mainViewController The view controller to display in the right view
 @return TWTMenuViewController A view that manages a menu view and opening/closing animations
 */
- (id)initWithMenuViewController:(UIViewController *)menuViewController mainViewController:(UIViewController *)mainViewController;

@end

@interface DTSideMenuViewController (MenuActions)

/** Open the left side menu; animated or not
 @param animated Is the menu open action animated
 */
- (void)openMenuAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

/** Close the left side menu; animated or not
 @param animated Is the menu close action animated
 */
- (void)closeMenuAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

/** Toggle the state of the left side menu
 @param animated Is the toggle action animated
 */
- (void)toggleMenuAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

@end

@interface DTSideMenuViewController (MainViewActions)

- (void)setMainViewController:(UIViewController *)mainViewController animated:(BOOL)animated closeMenu:(BOOL)closeMenu;

@end

@interface UIViewController (TWTSideMenuViewController)

@property (nonatomic, weak) DTSideMenuViewController *sideMenuViewController;

@end

