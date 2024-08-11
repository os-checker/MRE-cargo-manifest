```console
# .cargo will be detected in working dir, not detected by manifest-path's dir

echo "err due to lack of riscv64 toolchain"
cargo c --manifest-path ./inner/Cargo.toml

cd inner
echo "err because riscv64 requires no-std"
cargo c --manifest-path ../Cargo.toml
```

```console
mre-manifest-path ✗ sh reproducible.sh
err due to lack of riscv64 toolchain
    Checking inner v0.1.0 (/rust/tmp/os-checker/mre-manifest-path/inner)
error: invalid register `x10`: unknown register
 --> src/lib.rs:3:40
  |
3 |     unsafe { core::arch::asm!("ecall", in("x10") arg0) };
  |                                        ^^^^^^^^^^^^^^

error: could not compile `inner` (lib) due to 1 previous error
err because riscv64 requires no-std
    Checking mre-manifest-path v0.1.0 (/rust/tmp/os-checker/mre-manifest-path)
error[E0463]: can't find crate for `std`
  |
  = note: the `riscv64gc-unknown-none-elf` target may not support the standard library
  = note: `std` is required by `mre_manifest_path` because it does not declare `#![no_std]`
  = help: consider building the standard library from source with `cargo build -Zbuild-std`

For more information about this error, try `rustc --explain E0463`.
error: could not compile `mre-manifest-path` (lib) due to 1 previous error
```
