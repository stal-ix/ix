{% extends '//die/c/make.sh' %}

{% block pkg_name %}
firefox
{% endblock %}

{% block version %}
149.0.2
{% endblock %}

{% block fetch %}
https://archive.mozilla.org/pub/firefox/releases/{{self.version().strip()}}/source/firefox-{{self.version().strip()}}.source.tar.xz
6a931a2cf087164c689099c3856b3091a7e156a7b94fab8ab5712affe87870ce
{% endblock %}

{% block task_pool %}full{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/z
lib/ffi
lib/jpeg
lib/event
lib/webp
lib/pixman
lib/gtk/3
lib/glib
lib/pango
lib/cairo
lib/freetype
lib/harfbuzz
lib/fontconfig
lib/dbus
lib/alsa
lib/wayland
lib/wayland/dl
lib/drm
lib/drivers/3d
lib/kernel
lib/notify
lib/xkb/common
lib/atk
lib/llvm/21
lib/unwind
{% endblock %}

{% block bld_tool %}
bld/python/firefox
bld/rust/91
bld/cargo/91
bin/cbindgen
bin/nodejs
bld/nasm
bin/unzip
bld/bash
bld/pkg/config
{% endblock %}

{% block build_flags %}
wrap_cc
wrap_rdynamic
{% endblock %}

{% block cxx_flags %}
-Wno-deprecated-builtins
-Wno-deprecated-declarations
{% endblock %}


{% block patch %}
ulimit -n 4096

# musl: remove sys/single_threaded.h from system-headers
sed -i '/sys\/single_threaded.h/d' config/system-headers.mozbuild

# musl: remove features.h from system wrappers (conflicts on musl)
sed -i '/features\.h/d' config/system-headers.mozbuild

# musl: guard mallinfo usage with __GLIBC__
sed -i 's|^\(.*\)mallinfo\b|#ifdef __GLIBC__\n\1mallinfo\n#endif|' \
    xpcom/base/nsMemoryReporterManager.cpp 2>/dev/null || true

# musl: fix prctl.h conflict
for f in $(grep -rl '#include <linux/prctl.h>' third_party/ 2>/dev/null); do
    sed -i 's|#include <linux/prctl.h>|#if defined(__GLIBC__)\n#include <linux/prctl.h>\n#endif|' "$f"
done

# musl: fix lfs64 (musl doesn't have stat64 etc.)
for f in $(grep -rl '\bstat64\b\|fstatat64\|lstat64' security/ toolkit/ mozglue/ 2>/dev/null | head -30); do
    sed -i 's/\bstat64\b/stat/g; s/\bfstatat64\b/fstatat/g; s/\blstat64\b/lstat/g' "$f"
done

# musl: guard execinfo.h (no backtrace on musl)
sed -i '/execinfo\.h/d' config/system-headers.mozbuild


# musl: stub __libc_stack_end (glibc-specific)
sed -i 's|extern MOZ_EXPORT void\* __libc_stack_end;|#ifdef __GLIBC__\nextern MOZ_EXPORT void* __libc_stack_end;\n#else\nstatic void* __libc_stack_end = nullptr;\n#endif|' \
    mozglue/misc/StackWalk.cpp

# musl: fix missing pid_t in libwebrtc
sed -i '1s|^|#include <sys/types.h>\n|' \
    third_party/libwebrtc/modules/desktop_capture/desktop_capturer.h 2>/dev/null || true

# musl: sandbox sched_setscheduler - allow unconditionally
sed -i 's|sched_setscheduler.*Cond|sched_setscheduler\", Allow()|' \
    security/sandbox/linux/SandboxFilter.cpp 2>/dev/null || true

# fix SSE.cpp: extended asm needs %% for register names
python3 << 'PYEOF'
import re
with open("mozglue/misc/SSE.cpp") as f:
    c = f.read()
# in asm string literals inside extended asm, double the % before register names
# match lines like: "xchg %rsi, %rbx\n"  ->  "xchg %%rsi, %%rbx\n"
# only inside asm("...") blocks that have operand lists (: after closing ")
c = c.replace('"xchg %rsi, %rbx\\n"', '"xchg %%rsi, %%rbx\\n"')
c = c.replace('"xor %ecx, %ecx\\n"', '"xor %%ecx, %%ecx\\n"')
c = c.replace('"movl %eax, (%rdi)\\n"', '"movl %%eax, (%%rdi)\\n"')
c = c.replace('"movl %ebx, 4(%rdi)\\n"', '"movl %%ebx, 4(%%rdi)\\n"')
c = c.replace('"movl %ecx, 8(%rdi)\\n"', '"movl %%ecx, 8(%%rdi)\\n"')
c = c.replace('"movl %edx, 12(%rdi)\\n"', '"movl %%edx, 12(%%rdi)\\n"')
c = c.replace('"movl 1, %ecx\\n"', '"movl $1, %%ecx\\n"')
with open("mozglue/misc/SSE.cpp", "w") as f:
    f.write(c)
PYEOF

# rust: disable LTO (OOM on gkrust), increase codegen-units
sed -i 's/cargo_rustc_flags += -Clto/cargo_rustc_flags += -Clto=off/; s/codegen-units=1/codegen-units=8/g' config/makefiles/rust.mk 2>/dev/null || true

# rust: fix target detection to use RUST_TARGET
sed -i 's/unwrap_rustup(rustc)/rustc/' build/moz.configure/rust.configure 2>/dev/null || true

# wasm32-wasip1 rename for llvm 22+ (if applicable)
sed -i 's/wasm32-wasi\b/wasm32-wasip1/g' build/moz.configure/wasm.configure 2>/dev/null || true

# patch mach: no pip/venv in ix python, create dirs manually
python3 << 'PYEOF'
import re
with open("python/mach/mach/site.py") as f:
    c = f.read()
# skip pip check entirely
c = c.replace(
    "def _assert_pip_check(",
    "def _assert_pip_check_disabled("
)
c = "def _assert_pip_check(*a, **kw): pass\n" + c
# ensure dirs exist before writing pth file
c = c.replace(
    'with open(os.path.join(platlib_site_packages_dir, PTH_FILENAME), "w") as f:',
    'os.makedirs(platlib_site_packages_dir, exist_ok=True)\n'
    '    with open(os.path.join(platlib_site_packages_dir, PTH_FILENAME), "w") as f:'
)
# ensure bin dir exists for venv python symlink
c = c.replace(
    'os.symlink(sys.executable, venv_python)',
    'os.makedirs(os.path.dirname(venv_python), exist_ok=True)\n'
    '    os.symlink(sys.executable, venv_python)'
)
with open("python/mach/mach/site.py", "w") as f:
    f.write(c)
PYEOF

# fix rust target detection for musl
sed -i 's|die("Don'\''t know how to translate {} for rustc".format(host_or_target.alias))|return "{{target.rust}}"|' \
    build/moz.configure/rust.configure

# disable static libstdc++ check (ix links everything statically)
sed -i 's|die("Firefox does not support linking statically with libstdc++")|pass|' \
    build/moz.configure/flags.configure


# replace cargo-linker with rustcc-based wrapper (handles musl self-contained properly)
cat > build/cargo-linker << 'CLEOF'
#!/usr/bin/env python3
import os
import sys
import subprocess

def flt(cmd):
    out = []
    i = 0
    while i < len(cmd):
        a = cmd[i]
        if 'self-contained' in a and '.o' in a:
            i += 1; continue
        elif 'self-contained' in a:
            i += 1; continue
        elif a == '-L' and i+1 < len(cmd) and 'self-contained' in cmd[i+1]:
            i += 2; continue
        elif a == '-lgcc_s' or a == '-lgcc':
            i += 1; continue
        elif a == '-lstdc++':
            out.append('-lc++'); i += 1; continue
        elif a == '-static-pie':
            out.append('-static')
            i += 1; continue
        elif a == '-lc':
            i += 1; continue
        elif a == '-lunwind':
            i += 1; continue
        else:
            out.append(a)
        i += 1
    return out

fs_cc = os.environ.get('FREESTANDING_CLANG', 'clang')
args = sys.argv[1:]

base_dir = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
sys.path.insert(0, os.path.join(base_dir, "testing", "mozbase", "mozshellutil"))
from mozshellutil import split

cc = split(os.environ.get('MOZ_CARGO_WRAP_LD', os.environ.get('CC', 'cc')))
ldflags = split(os.environ.get('MOZ_CARGO_WRAP_LDFLAGS', ''))

def try_link(cmd):
    r = subprocess.call(cmd)
    if r == 0:
        sys.exit(0)

# try freestanding raw
try_link([fs_cc, '-fuse-ld=lld', '-nostdlib', '-nostdlib++'] + args)
# try freestanding filtered
try_link([fs_cc, '-fuse-ld=lld', '-nostdlib', '-nostdlib++'] + flt(args))
# try target CC filtered
try_link(cc + flt(args) + ldflags)
# try target CC raw
try_link(cc + args + ldflags)

sys.exit(1)
CLEOF
chmod +x build/cargo-linker

# create mozconfig
cat > mozconfig << 'MOZEOF'
ac_add_options --disable-bootstrap
ac_add_options --disable-cargo-incremental
ac_add_options --disable-crashreporter
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-install-strip
ac_add_options --disable-jemalloc
ac_add_options --disable-profiling
ac_add_options --disable-strip
ac_add_options --disable-tests
ac_add_options --disable-updater
ac_add_options --disable-audio-backends
ac_add_options --enable-alsa
ac_add_options --enable-application=browser
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
ac_add_options --enable-hardening
ac_add_options --enable-linker=lld
ac_add_options --enable-optimize
ac_add_options --enable-release
ac_add_options --enable-system-pixman
ac_add_options --disable-eme
ac_add_options --without-wasm-sandboxed-libraries
ac_add_options --with-system-ffi
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-webp
ac_add_options --with-system-zlib
MOZEOF

# skip libclang version check (we use static clang-sys, no dlopen needed)
sed -i '/def min_libclang_version/,/return False/{
    s/lib = CDLL(libclang)/return True/
}' build/moz.configure/bindgen.configure

# fix clang-sys/bindgen: no dlopen of libclang.so
# keep Cargo.toml/Cargo.lock intact - only patch source code
# 1. clang-sys build.rs: allow runtime+static coexist, static link = no-op
sed -i 's|panic!("`runtime` and `static` features can.t be combined");|// ix: ok|' \
    third_party/rust/clang-sys/build.rs
cat > third_party/rust/clang-sys/build/static.rs << 'SEOF'
pub fn link() {
}
SEOF
# 2. disable all runtime code paths in bindgen and clang-sys (no dlopen)
python3 << 'PYEOF'
for f in [
    "third_party/rust/bindgen/lib.rs",
    "third_party/rust/clang-sys/src/lib.rs",
    "third_party/rust/clang-sys/src/link.rs",
]:
    with open(f) as fh:
        c = fh.read()
    c = c.replace('#[cfg(feature = "runtime")]', '#[cfg(any())]')
    c = c.replace('#[cfg(not(feature = "runtime"))]', '#[cfg(all())]')
    with open(f, "w") as fh:
        fh.write(c)
PYEOF
# clear vendored checksums for patched crates
for crate in bindgen clang-sys; do
    sed -i 's/"files":{[^}]*}/"files":{}/' third_party/rust/${crate}/.cargo-checksum.json 2>/dev/null || true
done

# libclang.so symlink for configure check only (clang-sys uses static, never loads it)
mkdir -p ${tmp}/libclang
ln -s ${LLVM_DIR}/lib/libclang.a ${tmp}/libclang/libclang.so

# append dynamic paths to mozconfig
echo "ac_add_options --prefix=${out}" >> mozconfig
echo "ac_add_options --with-libclang-path=${tmp}/libclang" >> mozconfig

# ensure clang builtin headers are found (ix clang needs explicit -isystem)
if test -n "${CLANG_HEADERS}"; then
    echo "export CFLAGS=\"-isystem ${CLANG_HEADERS} \${CFLAGS}\"" >> mozconfig
    echo "export CXXFLAGS=\"-isystem ${CLANG_HEADERS} \${CXXFLAGS}\"" >> mozconfig
fi

# pass wrap_cc plugin flags to Firefox build
# LDFLAGS contains -L/PLUGIN:... from wrap_cc rdynamic plugin
echo "LDFLAGS from env: ${LDFLAGS}" >&2
echo "export LDFLAGS=\"${LDFLAGS}\"" >> mozconfig
{% endblock %}

{% block configure %}
export LIBCLANG_PATH=${LLVM_DIR}/lib
export LIBCLANG_STATIC_PATH=${LLVM_DIR}/lib
export MOZBUILD_STATE_PATH=${tmp}/.mozbuild
export MOZ_NOSPAM=1
export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system
export RUSTFLAGS=""
export CARGO_PROFILE_RELEASE_OPT_LEVEL=""
export CARGO_PROFILE_RELEASE_LTO=""
export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=8
export CARGO_BUILD_JOBS=4
# pass system include paths to bindgen
# order: libc++ first, then clang builtins, then the rest
BINDGEN_CXX=""
BINDGEN_REST=""
for p in $(${CXX:-clang++} -E -x c++ /dev/null -v 2>&1 | sed -n '/^#include.*search/,/^End/s|^ ||p'); do
    test -d "$p" || continue
    case "$p" in
        *c-plus-plus*|*c++*) BINDGEN_CXX="${BINDGEN_CXX} -isystem $p" ;;
        *) BINDGEN_REST="${BINDGEN_REST} -isystem $p" ;;
    esac
done
BINDGEN_CLANG=""
if test -n "${CLANG_HEADERS}"; then
    BINDGEN_CLANG="-isystem ${CLANG_HEADERS}"
fi
export BINDGEN_CFLAGS="${BINDGEN_CXX} ${BINDGEN_CLANG} ${BINDGEN_REST}"

python3 ./mach configure
{% endblock %}

{% block build %}
export LIBCLANG_PATH=${LLVM_DIR}/lib
export LIBCLANG_STATIC_PATH=${LLVM_DIR}/lib
export MOZBUILD_STATE_PATH=${tmp}/.mozbuild
export MOZ_NOSPAM=1
export MOZ_MAKE_FLAGS="-j$((make_thrs / 2 > 1 ? make_thrs / 2 : 2))"
export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system

python3 ./mach build
{% endblock %}

{% block install %}
export MOZBUILD_STATE_PATH=${tmp}/.mozbuild
export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system

DESTDIR=${tmp}/install python3 ./mach install

mkdir -p ${out}/bin ${out}/lib
cp -a ${tmp}/install/${out}/lib/firefox ${out}/lib/
ln -s ../lib/firefox/firefox ${out}/bin/firefox
{% endblock %}
