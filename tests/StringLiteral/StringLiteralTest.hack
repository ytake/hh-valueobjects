use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;
use type Ytake\HHValueObjects\StringLiteral\StringLiteral;

final class StringLiteralTest extends HackTest {

  public function testFromNative(): void {
    $string = new StringLiteral('foo');
    $constructedString = new StringLiteral('foo');
    expect($string->sameValueAs($constructedString))->toBeTrue();
  }

  public function testToNative() :void {
    $string = new StringLiteral('foo');
    expect($string->toNative())->toBePHPEqual('foo');
  }

  public function testSameValueAs(): void {
    $foo1 = new StringLiteral('foo');
    $foo2 = new StringLiteral('foo');
    $bar = new StringLiteral('bar');

    expect($foo1->sameValueAs($foo2))->toBeTrue();
    expect($foo2->sameValueAs($foo1))->toBeTrue();
    expect($foo1->sameValueAs($bar))->toBeFalse();
  }

  public function testIsEmpty(): void {
    $string = new StringLiteral('');
    expect($string->isEmpty())->toBeTrue();
  }

  public function testToString() : void {
    $foo = new StringLiteral('foo');
    expect($foo->__toString())->toBePHPEqual('foo');
  }
}
