//
//  Created by Ionut IVAN on 04/02/2015.
//

#import "IIFTextField.h"

@implementation IIFTextField

- (void)drawPlaceholderInRect:(CGRect)rect {
  NSDictionary *attributes = @{NSForegroundColorAttributeName : self.textColor,
                               NSFontAttributeName : self.font
                               };
  
  CGSize textSize = [self.placeholder sizeWithAttributes:attributes];
  
  //center vertically
  CGFloat hdif = rect.size.height - textSize.height;
  hdif = MAX(0, hdif);
  rect.origin.y += ceil(hdif/2.0);
  
  //center horizontally
  CGFloat wdif = rect.size.width - textSize.width;
  wdif = MAX(0, wdif);
  rect.origin.x += ceil(wdif/2.0);
  
  [self.placeholder drawInRect:rect
                withAttributes:attributes];
  
  
}

- (void)drawTextInRect:(CGRect)rect {
  NSDictionary *attributes = @{NSForegroundColorAttributeName : self.textColor,
                               NSFontAttributeName : self.font,
                               };

  CGSize textSize = [self.text sizeWithAttributes:attributes];
  
  //center vertically
  CGFloat hdif = rect.size.height - textSize.height;
  hdif = MAX(0, hdif);
  rect.origin.y += ceil(hdif/2.0);
  
  //center horizontally
  CGFloat wdif = rect.size.width - textSize.width;
  wdif = MAX(0, wdif);
  rect.origin.x += ceil(wdif/2.0);
  
  if (self.secureTextEntry) {
    NSMutableString *secureString = [NSMutableString stringWithCapacity:self.text.length];
    for (int i = 0; i< self.text.length; i++) {
      [secureString appendString:@"•"];
    }
    [secureString drawInRect:rect
              withAttributes:attributes];
  } else {
    [self.text drawInRect:rect
           withAttributes:attributes];
  }
  
}

@end
