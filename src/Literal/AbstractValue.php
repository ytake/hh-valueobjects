<?hh // strict

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
 * Copyright (c) 2018 Yuuki Takezawa
 */

namespace Ytake\HHValueObjects\Literal;

use type Ytake\HHValueObjects\ValueObjectInterface;

<<__ConsistentConstruct>>
abstract class AbstractValue<T> implements ValueObjectInterface<T> {

  public function __construct(
    protected T $value
  ) { }

  public function toNative(): T {
    return $this->value;
  }

  public function sameValueAs(this $t): bool {
    return $this->toNative() === $t->toNative();
  }
}
