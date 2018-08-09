<?hh // strict

use type PHPUnit\Framework\TestCase;
use type Ytake\HHValueObjects\Util\Util;
use type Ytake\HHValueObjects\StringLiteral\StringLiteral;
use type Ytake\HHValueObjects\Number\IntegerLiteral;

class UtilTest extends TestCase {

  public function testClassEquals(): void {
    $string = new StringLiteral('testing');
    $number = new IntegerLiteral(12345);
    $this->assertTrue(Util::classEquals($string, $string));
    $this->assertFalse(Util::classEquals($string, $number));
  }

  public function testGetClassAsString(): void {
    $string = new StringLiteral('testing');
    $this->assertEquals(StringLiteral::class, Util::getClassAsString($string));
  }
}
