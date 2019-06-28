use type Facebook\HackTest\{DataProvider, HackTest};
use function Facebook\FBExpect\expect;
use type Ytake\HHValueObjects\Climate\Kelvin;

final class KelvinTest extends HackTest {

  public function temperatureProvider(): vec<vec<Kelvin>> {
    return vec[
      vec[
        new Kelvin(10.0)
      ]
    ];
  }

  <<DataProvider('temperatureProvider')>>
  public function testToCelsius(Kelvin $temperature): void {
    expect($temperature->toCelsius()->toNative())->toBePHPEqual(10 - 273.15);
  }

  <<DataProvider('temperatureProvider')>>
  public function testToKelvin(Kelvin $temperature): void {
    expect($temperature->toKelvin()->toNative())->toBePHPEqual(10);
  }

  <<DataProvider('temperatureProvider')>>
  public function testToFahrenheit(Kelvin $temperature): void {
    expect(
      $temperature->toFahrenheit()->toNative()
    )->toBePHPEqual(
      $temperature->toCelsius()->toNative() * 1.8 + 32
    );
  }
}
