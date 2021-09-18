What is `'a` ?
==============
Is named lifetime `a` of a reference (rust/src/doc/book/lifetime.md)

> The 'a reads ‘the lifetime a’.

this enable the compiler to detect use of resource __after__ borrower destroyed it.
this is "scope of reference" algebra for compiler.

> only applies to reference.

> The annotations, however, give information about lifetimes to the compiler that uses them to check the validity of references.
> The compiler can do so without annotations in simple cases, but needs the programmer's support in complex scenarios.

baked in lifetime: `'static`

What is self.0?
===============

```rust
  // Silly wrapper since Arc<PathBuf> doesn't implement AsRef<Path> ;_;
  #[derive(Clone, Debug)]
  struct ArcPath(Arc<PathBuf>);

  impl AsRef<Path> for ArcPath {
      fn as_ref(&self) -> &Path {
          (*self.0).as_ref()
      }
  }
```

It is a mere tuple access!
