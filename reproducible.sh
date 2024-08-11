# .cargo will be detected in working dir, not detected by manifest-path's dir

echo "err due to lack of riscv64 toolchain"
cargo c --manifest-path ./inner/Cargo.toml

cd inner
echo "err because riscv64 requires no-std"
cargo c --manifest-path ../Cargo.toml
