<?hh // strict

namespace Ytake\HHValueObjects\Number;

class IntegerLiteral extends AbstractNumber<int> {

  public function toFloat(): FloatLiteral {
    return new FloatLiteral((float)$this->value);
  }
}
