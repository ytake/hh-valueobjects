use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;
use type Ytake\HHValueObjects\Money\{Currency, CurrencyCode};

final class CurrencyTest extends HackTest {

  public function testShouldBeSameValue(): void {
    $constructedCurrency = new Currency(CurrencyCode::EUR);
    expect(
      $constructedCurrency->sameValueAs(
        new Currency(CurrencyCode::EUR)
      )
    )->toBeTrue();
  }

  public function testShouldReturnCode(): void {
    $constructedCurrency = new Currency(CurrencyCode::JPY);
    expect($constructedCurrency->getCode())->toBeSame('JPY');
  }
}
