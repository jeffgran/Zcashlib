# Zcashlib

A proof-of-concept [swift package](https://swift.org/package-manager/) wrapping [librustzcash](https://github.com/zcash/librustzcash)

## To build the librustzcash dependency

#### Install Cargo Lipo

[cargo-lipo](https://github.com/TimNN/cargo-lipo) helps cargo build universal binaries for ios/apple architectures.

```bash
cargo install cargo-lipo
```

#### Install apple rust targets

```bash
rustup target add aarch64-apple-ios armv7-apple-ios armv7s-apple-ios x86_64-apple-ios i386-apple-ios
```

#### Init submodule

The librustzcash library is just a git submodule for now.

```bash
git submodule init
git submodule update
```

#### Build librustzcash

```bash
cd librustzcash/librustzcash/
cargo lipo --release
# Copy the header and binary into the Swift Package
cp include/librustzcash.h ../../Sources/Librustzcash/include/
cp ../target/universal/release/librustzcash.a ../../Sources/Librustzcash/lib/
```

## To build

Swift PM can't find the static library to link autmoatically so we have to tell it where it is.

```bash
swift build -Xlinker -L -Xlinker /Users/jeffgran/dev/Zcashlib/Sources/Librustzcash/lib
```

## To run tests

```bash
swift test -Xlinker -L -Xlinker /Users/jeffgran/dev/Zcashlib/Sources/Librustzcash/lib
```

