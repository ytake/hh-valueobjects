<?hh // strict

use type PHPUnit\Framework\TestCase;
use type Ytake\HHValueObjects\Climate\Kelvin;

class  KelvinTest extends TestCase {

  public function temperatureProvider(): array<array<Kelvin>> {
    return [[new Kelvin(10.0)]];
  }

  /**
   * @dataProvider temperatureProvider
   */
  public function testToCelsius(Kelvin $temperature): void {
    $this->assertEquals(10 - 273.15, $temperature->toCelsius()->toNative());
  }

  /**
   * @dataProvider temperatureProvider
   */
  public function testToKelvin(Kelvin $temperature): void {
    $this->assertEquals(10, $temperature->toKelvin()->toNative());
  }

  /**
   * @dataProvider temperatureProvider
   */
  public function testToFahrenheit(Kelvin $temperature): void {
    $this->assertEquals(
      $temperature->toCelsius()->toNative() * 1.8 + 32, 
      $temperature->toFahrenheit()->toNative()
    );
  }
}
