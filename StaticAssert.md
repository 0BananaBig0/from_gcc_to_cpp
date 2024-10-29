<!-- vim-markdown-toc GFM -->

- [`static_assert`](#static_assert)
  - [Explanation](#explanation)
  - [Syntax](#syntax)

<!-- vim-markdown-toc -->

## `static_assert`

### Explanation

1. `static_assert` is **a compile-time assertion** that allows you to **check conditions during
   compilation** rather than at runtime.
2. If **the condition** evaluates to **false**, **a compilation error** is generated, helping you
   catch issues early in the development process.
3. **The condition** must be **a compile-time constant expression**.

### Syntax

```CPP
static_assert(condition, "Error message");
```
