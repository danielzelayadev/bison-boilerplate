# Bison Boilerplate

A basic bison boilerplate.

## Getting Started

### Requirements

- [g++](https://gcc.gnu.org/)
- flex
- bison
- [make](https://www.gnu.org/software/make/)

### Build

```
    $ make
```

### Build & Run

```
    $ make run
```

### Clean

```
    $ make clean
```

## Caveats

Relative includes (`#include "./foo.h"`) in `*.l` and `*.y` files must be relative to the `dst` directory which will be generated when you build the project, otherwise the compiler will throw an error.

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/danielzy95/bison-boilerplate/blob/master/LICENSE) file for details.