#import <UIKit/UIKit.h>

// This logic hooks into the application container automatically when injected
__attribute__((constructor)) static void initialize_silentx_menu() {
    // Delays the initialization for 3 seconds to let the main game view populate
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // Find the active display window
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        if (!keyWindow) return;

        // Create the dark-themed pop-up background container
        UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 180)];
        alertView.center = keyWindow.center;
        alertView.backgroundColor = [UIColor colorWithRed:0.12 green:0.12 blue:0.14 alpha:0.95]; // Deep charcoal
        alertView.layer.cornerRadius = 15.0;
        alertView.layer.borderWidth = 1.5;
        alertView.layer.borderColor = [UIColor colorWithRed:0.35 green:0.35 blue:0.40 alpha:1.0].CGColor; // Subtle gray frame border
        alertView.clipsToBounds = YES;

        // Custom Header Label for the SILENTX Branding
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 300, 40)];
        titleLabel.text = @"SILENTX";
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont fontWithName:@"AvenirNext-Heavy" size:28]; // Sleek bold title font
        
        // Status Subtitle
        UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 75, 300, 30)];
        subLabel.text = @"UI Loaded Successfully";
        subLabel.textColor = [UIColor lightGrayColor];
        subLabel.textAlignment = NSTextAlignmentCenter;
        subLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:14];

        // Dismiss View Interactive Button
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        closeButton.frame = CGRectMake(100, 125, 100, 35);
        closeButton.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.30 alpha:1.0];
        [closeButton setTitle:@"Dismiss" forState:UIControlStateNormal];
        [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        closeButton.titleLabel.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:14];
        closeButton.layer.cornerRadius = 8.0;
        
        // Linking action to remove layout view window from screen overlay when clicked
        [closeButton addTarget:alertView action:@selector(removeFromSuperview) forControlEvents:UIControlEventTouchUpInside];

        // Assemble the UI modules inside the master window view parent container
        [alertView addSubview:titleLabel];
        [alertView addSubview:subLabel];
        [alertView addSubview:closeButton];
        [keyWindow addSubview:alertView];
    });
}
