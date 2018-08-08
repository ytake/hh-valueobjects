<?hh // strict

use type PHPUnit\Framework\TestCase;
use type Ytake\HHValueObjects\StringLiteral\StringLiteral;

final class StringLiteralTest extends TestCase {

  public function testFromNative(): void {
    $string = new StringLiteral('foo');
    $constructedString = new StringLiteral('foo');
    $this->assertTrue($string->sameValueAs($constructedString));
  }

  public function testToNative() :void {
    $string = new StringLiteral('foo');
    $this->assertEquals('foo', $string->toNative());
  }

  public function testSameValueAs(): void {
    $foo1 = new StringLiteral('foo');
    $foo2 = new StringLiteral('foo');
    $bar = new StringLiteral('bar');

    $this->assertTrue($foo1->sameValueAs($foo2));
    $this->assertTrue($foo2->sameValueAs($foo1));
    $this->assertFalse($foo1->sameValueAs($bar));
  }

  public function testIsEmpty(): void {
    $string = new StringLiteral('');
    $this->assertTrue($string->isEmpty());
  }

  public function testToString() : void {
    $foo = new StringLiteral('foo');
    $this->assertEquals('foo', $foo->__toString());
  }
}
