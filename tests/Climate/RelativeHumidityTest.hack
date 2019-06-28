use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;
use type Ytake\HHValueObjects\Climate\RelativeHumidity;

final class RelativeHumidityTest extends HackTest {

  public function testFromNative(): void {
    $constructedRelHum = new RelativeHumidity(70);
    $constructed = new RelativeHumidity(70);
    expect($constructed->sameValueAs($constructedRelHum))->toBeTrue();
  }
}
