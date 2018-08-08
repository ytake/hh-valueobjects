<?hh // strict

use type PHPUnit\Framework\TestCase;
use type Ytake\HHValueObjects\Number\IntegerLiteral;
use function strval;

class IntegerLiteralTest extends TestCase
{
  public function testToNative(): void {
    $integer = new IntegerLiteral(5);
    $this->assertSame(5, $integer->toNative());
  }

  public function testSameValueAs(): void {
    $integer1 = new IntegerLiteral(3);
    $integer2 = new IntegerLiteral(3);
    $integer3 = new IntegerLiteral(45);
    $this->assertTrue($integer1->sameValueAs($integer2));
    $this->assertTrue($integer2->sameValueAs($integer1));
    $this->assertFalse($integer1->sameValueAs($integer3));
  }

  public function testToString(): void {
    $integer = new IntegerLiteral(87);
    $this->assertSame('87', strval($integer));
  }

  public function testZeroToString(): void {
    $zero = new IntegerLiteral(0);
    $this->assertSame('0', strval($zero));
  }
}
