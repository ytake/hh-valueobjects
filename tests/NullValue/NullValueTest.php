<?hh // strict

use type PHPUnit\Framework\TestCase;
use type Ytake\HHValueObjects\NullValue\NullValue;
use function strval;

final class NullValueTest extends TestCase {

  public function testShouldReturnSameValue(): void {
    $null1 = new NullValue();
    $null2 = new NullValue();
    $this->assertTrue($null1->sameValueAs($null2));
  }

  public function testShouldRetrunString(): void {
    $this->assertSame('', strval(new NullValue()));
  }

  public function testShouldReturnNull(): void {
    $this->assertNull(new NullValue()|>$$->toNative());
  }
}
