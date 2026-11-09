# veux kernel builder — IranTSR + KernelSU Next

Builds a custom kernel for the **POCO X4 Pro 5G (veux, Snapdragon 695)** running
stock **HyperOS 1 / Android 13**, with **KernelSU Next** integrated.

- **Base:** [dereference23/kernel_xiaomi_sm6375](https://github.com/dereference23/kernel_xiaomi_sm6375), tag `20260613` (kernel **5.4.302**)
- **KernelSU Next:** legacy driver **v3.4.0-legacy** (kernel KSU version 33294, pairs with manager **v3.4.2**)
- **Kernel name:** `5.4.302-IranTSR` (`CONFIG_LOCALVERSION="-IranTSR"`, `localversion` file)
- **Battery tuning (safe):** schedutil default governor, power-efficient workqueues, EAS energy model, tickless idle, debug info off. No undervolting, no overclocking.
- **Toolchain:** AOSP clang **r416183b** + GCC 4.9 cross compilers
- **Output:** AnyKernel3 flashable zip (`veux-IranTSR-KSU-Next.zip`) — flash in **OrangeFox**

## How it works

The workflow (`.github/workflows/build-kernel.yml`) clones the kernel source,
integrates KernelSU Next via the official `setup.sh`, applies
`patches/veux.patch` (defconfig, `localversion`, and the `can_umount` fix the
KSU build-time patch needs on this tree), builds `Image.gz-dtb`, and packages
it with the customized `anykernel.sh`.

## Flashing

1. **Back up the Boot partition in OrangeFox first** — this is the way back if
   anything goes wrong.
2. Flash `veux-IranTSR-KSU-Next.zip` in OrangeFox, reboot.
3. The KernelSU Next manager (v3.4.2) should show the kernel as working.

Releases are published automatically by the workflow on every push to `main`.
