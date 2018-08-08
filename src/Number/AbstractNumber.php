<?hh // strict

namespace Ytake\HHValueObjects\Number;

use type Ytake\HHValueObjects\Literal\AbstractValue;
use function abs;
use function round;

abstract class AbstractNumber<T> extends AbstractValue<T> {

  <<__Override>>
  public function __toString(): string {
    return \strval($this->toNative());
  }

  public function toNatural(
    ?RoundingMode $roundingMode = null
  ): NaturalLiteral {
    $integer = $this->toInteger($roundingMode)->toNative();
    return new NaturalLiteral((int)abs($integer));
  }

  public function toInteger(
    ?RoundingMode $roundingMode = null
  ): IntegerLiteral {
    if (null === $roundingMode) {
      $roundingMode = RoundingMode::HALF_UP;
    }
    return new IntegerLiteral(
      (int) round($this->toNative(), 0, $roundingMode)
    );
  }
}
