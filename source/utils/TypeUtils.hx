package utils;

class TypeUtils
{
	/**
	 * Determines if the provided boolean value is `true`.
	 *
	 * This utility method is used to explicitly check if a given boolean value
	 * is `true`. While it might seem trivial, using this method can improve code
	 * readability in some contexts by making the intention of checking for a `true`
	 * value explicit.
	 *
	 * In cases where complex logical conditions are evaluated, or where the
	 * code requires enhanced readability and maintainability, this method
	 * can help convey the intention clearly to other developers. It is especially
	 * useful when combined with functional interfaces, lambda expressions, or when
	 * the method reference is needed for boolean checks.
	 *
	 * ### Behavior:
	 * - If the `value` is `true`, the method returns `true`.
	 * - If the `value` is `false`, the method returns `false`.
	 *
	 * ### Usage Scenarios:
	 * - **Code Readability:** When a conditional check is involved, using `isTrue()` might make the code more readable.
	 *   Example: `if (isTrue(flag)) { ... }` clearly conveys that we are checking for a `true` condition.
	 * - **Method References and Functional Interfaces:** This method can be used as a method reference in streams or
	 *   with higher-order functions that require a predicate or boolean check.
	 *   Example: `list.stream().filter(this::isTrue).count();`
	 * - **Integration with Custom Logic:** Can be useful in custom implementations where you want to encapsulate and
	 *   centralize all `true` checks to a single method.
	 *
	 * ### Example Usage:
	 * // Simple boolean check
	 * var result1 = isTrue(true);  // returns true
	 * var result2 = isTrue(false); // returns false
	 *
	 * // Use in a conditional check
	 * if (isTrue(result1)) {
	 *     Sys.println("The result is true.");
	 * }
	 *
	 * @param value The boolean value to be evaluated.
	 * @return `true` if the provided value is `true`; `false` otherwise.
	 */
	@:noPrivateAccess @:unreflective public static inline extern function isTrue(value:Bool)
	{
		return (value == true);
	}
}
