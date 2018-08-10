<?hh // strict

use type PHPUnit\Framework\TestCase;
use type Ytake\HHValueObjects\Climate\RelativeHumidity;

final class RelativeHumidityTest extends TestCase {
  public function testFromNative(): void {
    $constructedRelHum = new RelativeHumidity(70);
    $constructed = new RelativeHumidity(70);
    $this->assertTrue($constructed->sameValueAs($constructedRelHum));
  }
}
