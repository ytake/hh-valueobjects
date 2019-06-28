use type Facebook\HackTest\HackTest;
use type Ytake\HHValueObjects\Number\{FloatLiteral, IntegerLiteral};
use function strval;
use function Facebook\FBExpect\expect;

final class IntegerLiteralTest extends HackTest {

  public function testToNative(): void {
    $integer = new IntegerLiteral(5);
    expect($integer->toNative())->toBeSame(5);
  }

  public function testShouldBeFloat(): void {
    $integer = new IntegerLiteral(5);
    expect($integer->toFloat()->toNative())->toBeSame((float) 5, 'not same!');
    expect($integer->toFloat() is FloatLiteral)->toBeTrue();
  }

  public function testSameValueAs(): void {
    $integer1 = new IntegerLiteral(3);
    $integer2 = new IntegerLiteral(3);
    $integer3 = new IntegerLiteral(45);
    expect($integer1->sameValueAs($integer2))->toBeTrue();
    expect($integer2->sameValueAs($integer1))->toBeTrue();
    expect($integer1->sameValueAs($integer3))->toBeFalse();
  }

  public function testToString(): void {
    $integer = new IntegerLiteral(87);
    expect(strval($integer))->toBeSame('87');
  }

  public function testZeroToString(): void {
    $zero = new IntegerLiteral(0);
    expect(strval($zero))->toBeSame('0');
  }
}
