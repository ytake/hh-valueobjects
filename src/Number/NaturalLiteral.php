<?hh // strict

namespace Ytake\HHValueObjects\Number;

use type Ytake\HHValueObjects\Exception\InvalidNativeArgumentException;
use const FILTER_VALIDATE_INT;
use function filter_var;

class NaturalLiteral extends IntegerLiteral {

  public function __construct(
    int $value
  ) {
    $value = filter_var($value, FILTER_VALIDATE_INT, [
      'options' => [
        'min_range' => 0
      ]
    ]);
    if (false === $value) {
      throw new InvalidNativeArgumentException($value);
    }
    parent::__construct($value);
  }
}
