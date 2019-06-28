use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;
use type Ytake\HHValueObjects\Util\Util;
use type Ytake\HHValueObjects\StringLiteral\StringLiteral;
use type Ytake\HHValueObjects\Number\IntegerLiteral;

final class UtilTest extends HackTest {

  public function testClassEquals(): void {
    $string = new StringLiteral('testing');
    $number = new IntegerLiteral(12345);
    expect(Util::classEquals($string, $string))->toBeTrue();
    expect(Util::classEquals($string, $number))->toBeFalse();
  }

  public function testGetClassAsString(): void {
    $string = new StringLiteral('testing');
    expect(Util::getClassAsString($string))->toBePHPEqual(StringLiteral::class);
  }
}
