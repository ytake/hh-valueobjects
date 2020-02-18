use type Facebook\HackTest\{DataProvider, HackTest};
use function Facebook\FBExpect\expect;
use type Ytake\HHValueObjects\Climate\Celsius;

final class CelsiusTest extends HackTest {

  public function temperatureProvider(): vec<vec<Celsius>> {
    return vec[
      vec[new Celsius(10.0)]
    ];
  }

  <<DataProvider('temperatureProvider')>>
  public function testToCelsius(Celsius $temperature): void {
    expect($temperature->toCelsius()->toNative())->toBePHPEqual(10);
  }

  <<DataProvider('temperatureProvider')>>
  public function testToKelvin(Celsius $temperature): void {
    expect($temperature->toKelvin()->toNative())->toBePHPEqual(10 + 273.15);
  }

  <<DataProvider('temperatureProvider')>>
  public function testToFahrenheit(Celsius $temperature): void {
    expect($temperature->toFahrenheit()->toNative())->toBePHPEqual(10 * 1.8 + 32);
  }
}
