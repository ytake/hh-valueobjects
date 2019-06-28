/**
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * This software consists of voluntary contributions made by many individuals
 * and is licensed under the MIT license.
 *
 * Copyright (c) 2018-2019 Yuuki Takezawa
 */

namespace Ytake\HHValueObjects\Number;

use type Ytake\HHValueObjects\Literal\AbstractValue;
use function abs;
use function round;

abstract class AbstractNumber<T> extends AbstractValue<T> {

  <<__Override>>
  public function __toString(): string {
    return \strval($this->toNative());
  }

  public function toNatural(
    ?RoundingMode $roundingMode = null
  ): NaturalLiteral {
    $integer = $this->toInteger($roundingMode)->toNative();
    return new NaturalLiteral((int)abs($integer));
  }

  public function toInteger(
    ?RoundingMode $roundingMode = null
  ): IntegerLiteral {
    if (null === $roundingMode) {
      $roundingMode = RoundingMode::HALF_UP;
    }
    return new IntegerLiteral(
      (int) round($this->toNative(), 0, $roundingMode)
    );
  }
}
