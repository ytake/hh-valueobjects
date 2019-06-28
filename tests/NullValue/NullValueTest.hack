use type Facebook\HackTest\HackTest;
use type Ytake\HHValueObjects\NullValue\NullValue;
use function strval;
use function Facebook\FBExpect\expect;

final class NullValueTest extends HackTest {

  public function testShouldReturnSameValue(): void {
    $null1 = new NullValue();
    $null2 = new NullValue();
    expect($null1->sameValueAs($null2))->toBeTrue();
  }

  public function testShouldRetrunString(): void {
    expect(strval(new NullValue()))->toBeSame('');
  }

  public function testShouldReturnNull(): void {
    expect(new NullValue()|>$$->toNative())->toBeNull();
  }
}
