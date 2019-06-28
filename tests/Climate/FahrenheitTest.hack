use type Facebook\HackTest\{DataProvider, HackTest};
use function Facebook\FBExpect\expect;
use type Ytake\HHValueObjects\Climate\Fahrenheit;

final class FahrenheitTest extends HackTest {

  public function temperatureProvider(): array<array<Fahrenheit>> {
    return array(array(new Fahrenheit(10.0)));
  }

  <<DataProvider('temperatureProvider')>>
  public function testToCelsius(Fahrenheit $temperature): void {
    expect($temperature->toCelsius()->toNative())->toBePHPEqual((10 - 32) / 1.8);
  }

  <<DataProvider('temperatureProvider')>>
  public function testToKelvin(Fahrenheit $temperature): void {
    expect(
      round($temperature->toKelvin()->toNative(), 8)
    )->toBePHPEqual(
      round($temperature->toCelsius()->toNative() + 273.15, 8)
    );
  }

  <<DataProvider('temperatureProvider')>>
  public function testToFahrenheit(Fahrenheit $temperature): void {
    expect($temperature->toFahrenheit()->toNative())->toBePHPEqual(10);
  }
}
