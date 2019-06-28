use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;
use type Ytake\HHValueObjects\Person\Age;

final class AgeTest extends HackTest {

  public function testToNative(): void {
    $age = new Age(25);
    expect($age->toNative())->toBePHPEqual(25);
  }

  public function testSameValueAs(): void {
    $age1 = new Age(33);
    $age2 = new Age(33);
    $age3 = new Age(66);
    expect($age1->sameValueAs($age2))->toBeTrue();
    expect($age2->sameValueAs($age1))->toBeTrue();
    expect($age1->sameValueAs($age3))->toBeFalse();
  }

  public function testToString(): void {
    $age = new Age(54);
    expect(\strval($age))->toBePHPEqual('54');
 }
}
