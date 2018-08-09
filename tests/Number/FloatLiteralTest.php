<?hh // strict

use type PHPUnit\Framework\TestCase;
use type Ytake\HHValueObjects\Number\FloatLiteral;
use type Ytake\HHValueObjects\Number\IntegerLiteral;
use type Ytake\HHValueObjects\Number\NaturalLiteral;

class FloatLiteralTest extends TestCase {

  public function testFromNative():void {
    $constructed = new FloatLiteral(.056);
    $this->assertTrue(new FloatLiteral(.056)|>$$->sameValueAs(new FloatLiteral(.056)));
  }

  public function testToNative(): void {
    $this->assertEquals(3.4, new FloatLiteral(3.4)|>$$->toNative());
  }

  public function testSameValueAs() : void {
    $real1 = new FloatLiteral(5.64);
    $real2 = new FloatLiteral(5.64);
    $real3 = new FloatLiteral(6.01);
    $this->assertTrue($real1->sameValueAs($real2));
    $this->assertTrue($real2->sameValueAs($real1));
    $this->assertFalse($real1->sameValueAs($real3));
  }

  public function testToInteger() : void {
    $real          = new FloatLiteral(3.14);
    $nativeInteger = new IntegerLiteral(3);
    $integer       = $real->toInteger();
    $this->assertTrue($integer->sameValueAs($nativeInteger));
  }

  public function testToNatural() : void {
    $real          = new FloatLiteral(3.14);
    $nativeNatural = new NaturalLiteral(3);
    $natural       = $real->toNatural();
    $this->assertTrue($natural->sameValueAs($nativeNatural));
  }

  public function testToString(): void{
    $real = new FloatLiteral(.7);
    $this->assertEquals('.7', $real->__toString());
  }
}
