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

namespace Ytake\HHValueObjects\Climate;

use type Ytake\HHValueObjects\Exception\InvalidNativeArgumentException;
use type Ytake\HHValueObjects\Number\NaturalLiteral;
use function filter_var;

use const FILTER_VALIDATE_INT;

class RelativeHumidity extends NaturalLiteral {

  const int MIN = 0;
  const int MAX = 100;

  public function __construct(
    int $value
  ) {
    $value = filter_var($value, FILTER_VALIDATE_INT, [
      'options' => [
        'min_range' => self::MIN,
        'max_range' => self::MAX
      ]
    ]);
    if (false === $value) {
      throw new InvalidNativeArgumentException(
        $value,
        vec['int (>='.self::MIN.', <='.self::MAX.')']
      );
    }
    parent::__construct($value);
  }
}
