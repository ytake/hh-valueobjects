<?hh // strict

use type PHPUnit\Framework\TestCase;
use type Ytake\HHValueObjects\Money\Currency;
use type Ytake\HHValueObjects\Money\CurrencyCode;

final class CurrencyTest extends TestCase {

  public function testShouldBeSameValue(): void {
    $constructedCurrency = new Currency(CurrencyCode::EUR);
    $this->assertTrue(
      $constructedCurrency->sameValueAs(new Currency(CurrencyCode::EUR))
    );
  }

  public function testShouldReturnCode(): void {
    $constructedCurrency = new Currency(CurrencyCode::JPY);
    $this->assertSame('JPY', $constructedCurrency->getCode());
  }
}
