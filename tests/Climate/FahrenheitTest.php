<?hh // strict

use type PHPUnit\Framework\TestCase;
use type Ytake\HHValueObjects\Climate\Fahrenheit;

class FahrenheitTest extends TestCase
{
  public function temperatureProvider(): array<array<Fahrenheit>> {
    return array(array(new Fahrenheit(10.0)));
  }

  /**
   * @dataProvider temperatureProvider
   */
  public function testToCelsius(Fahrenheit $temperature): void {
    $this->assertEquals((10 - 32) / 1.8, $temperature->toCelsius()->toNative());
  }

  /**
   * @dataProvider temperatureProvider
   */
  public function testToKelvin(Fahrenheit $temperature): void {
    $this->assertEquals(
      round($temperature->toCelsius()->toNative() + 273.15, 8),
      round($temperature->toKelvin()->toNative(), 8)
    );
  }

  /**
   * @dataProvider temperatureProvider
   */
  public function testToFahrenheit(Fahrenheit $temperature): void {
    $this->assertEquals(10, $temperature->toFahrenheit()->toNative());
  }
}
