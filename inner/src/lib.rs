#![no_std]
pub fn ecall(arg0: u8) {
    unsafe { core::arch::asm!("ecall", in("x10") arg0) };
}
