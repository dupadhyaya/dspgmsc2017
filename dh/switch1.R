#Switch

use.switch <- function(x)
{
  switch(x,
         'a' = 'First',
         'b' = 'Second',
         'c' =  'Third',
         'other')
}

use.switch('a')
use.switch('other')
use.switch('6')
use.switch(6)  # nothing returned

