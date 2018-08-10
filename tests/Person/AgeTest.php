<?hh // strict

use type PHPUnit\Framework\TestCase;
use type Ytake\HHValueObjects\Person\Age;

class AgeTest extends TestCase {

  public function testToNative(): void {
    $age = new Age(25);
    $this->assertEquals(25, $age->toNative());
  }

  public function testSameValueAs(): void {
    $age1 = new Age(33);
    $age2 = new Age(33);
    $age3 = new Age(66);
    $this->assertTrue($age1->sameValueAs($age2));
    $this->assertTrue($age2->sameValueAs($age1));
    $this->assertFalse($age1->sameValueAs($age3));
  }

  public function testToString(): void {
    $age = new Age(54);
    $this->assertEquals('54', \strval($age));
 }
}
