<?hh // strict

namespace Ytake\HHValueObjects\Number;

use const PHP_ROUND_HALF_UP;
use const PHP_ROUND_HALF_DOWN;
use const PHP_ROUND_HALF_EVEN;
use const PHP_ROUND_HALF_ODD;

enum RoundingMode: int as int {
  HALF_UP   = PHP_ROUND_HALF_UP;
  HALF_DOWN = PHP_ROUND_HALF_DOWN;
  HALF_EVEN = PHP_ROUND_HALF_EVEN;
  HALF_ODD  = PHP_ROUND_HALF_ODD;
}
