<?hh // strict

use type PHPUnit\Framework\TestCase;
use type Ytake\HHValueObjects\Climate\Celsius;

class CelsiusTest extends TestCase {

  public function temperatureProvider(): array<array<Celsius>> {
    return [[new Celsius(10.0)]];
  }

  /**
   * @dataProvider temperatureProvider
   */
  public function testToCelsius(Celsius $temperature): void {
    $this->assertEquals(10, $temperature->toCelsius()->toNative());
  }

  /**
   * @dataProvider temperatureProvider
   */
  public function testToKelvin(Celsius $temperature): void {
    $this->assertEquals(10 + 273.15, $temperature->toKelvin()->toNative());
  }

  /**
   * @dataProvider temperatureProvider
   */
  public function testToFahrenheit(Celsius $temperature): void {
    $this->assertEquals(10 * 1.8 + 32, $temperature->toFahrenheit()->toNative());
  }
}
