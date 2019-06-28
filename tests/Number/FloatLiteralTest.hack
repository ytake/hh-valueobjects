use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;
use type Ytake\HHValueObjects\Number\{FloatLiteral, IntegerLiteral, NaturalLiteral};

final class FloatLiteralTest extends HackTest {

  public function testFromNative():void {
    $constructed = new FloatLiteral(.056);
    expect(new FloatLiteral(.056)|>$$->sameValueAs(new FloatLiteral(.056)))->toBeTrue();
  }

  public function testToNative(): void {
    expect(new FloatLiteral(3.4)|>$$->toNative())->toBePHPEqual(3.4);
  }

  public function testSameValueAs() : void {
    $real1 = new FloatLiteral(5.64);
    $real2 = new FloatLiteral(5.64);
    $real3 = new FloatLiteral(6.01);
    expect($real1->sameValueAs($real2))->toBeTrue();
    expect($real2->sameValueAs($real1))->toBeTrue();
    expect($real1->sameValueAs($real3))->toBeFalse();
  }

  public function testToInteger() : void {
    $real          = new FloatLiteral(3.14);
    $nativeInteger = new IntegerLiteral(3);
    $integer       = $real->toInteger();
    expect($integer->sameValueAs($nativeInteger))->toBeTrue();
  }

  public function testToNatural() : void {
    $real          = new FloatLiteral(3.14);
    $nativeNatural = new NaturalLiteral(3);
    $natural       = $real->toNatural();
    expect($natural->sameValueAs($nativeNatural))->toBeTrue();
  }

  public function testToString(): void{
    $real = new FloatLiteral(.7);
    expect($real->__toString())->toBePHPEqual('.7');
  }
}
