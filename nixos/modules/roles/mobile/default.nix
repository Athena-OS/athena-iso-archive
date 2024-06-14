{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    amoco
    android-udev-rules
    apkid
    apkleaks
    apktool
    binwalk
    bsdiff
    capstone
    cargo-ndk
    ctypes_sh
    # https://github.com/NixOS/nixpkgs/issues/308262
    #cutter
    #cutterPlugins.rz-ghidra
    dex2jar
    edb
    eresi
    flasm
    frida-tools
    ghidra
    ghost
    hopper
    iaito
    jadx
    # https://github.com/NixOS/nixpkgs/issues/308260
    #jd-cli
    jd-gui
    jsbeautifier
    kalibrate-rtl
    klee
    lief
    pe-bear
    pev
    pwntools
    python312Packages.angr
    python312Packages.distorm3
    python312Packages.frida-python
    python312Packages.pwntools
    python312Packages.pyaxmlparser
    python312Packages.pyjsparser
    quark-engine
    radare2
    retdec
    rizin
    rizinPlugins.rz-ghidra
    scanmem
    #swftools
    udis86
    uefi-firmware-parser
    vivisect
  ];
}
