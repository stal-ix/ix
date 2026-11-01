{% extends '//die/c/configure.sh' %}

{# OpenJDK 8u for the target, cross-compiled, with bld/java/8 as the boot
   JDK: JDK 8 runs none of what it builds, every tool of the build runs on
   the boot JDK. Server VM, headless, no native AWT; built in two passes
   like bin/java/11 and on: libs keeps the native libraries as archives,
   unwrap registers them for dlopen. #}

{% block fetch %}
https://github.com/openjdk/jdk8u/archive/refs/tags/jdk8u504-ga.tar.gz
406a990606b3452485b1554d0b9463fa0ef8e34c70cd1033b54ff12dd9a2f611
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/alsa
lib/cups
lib/kernel
lib/freetype
lib/shim/x11
lib/shim/iced
{% endblock %}

{# adlc and the other generators hotspot builds and runs #}
{% block host_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bin/zip
bld/bash
bin/unzip
bld/java/8
# libjsig is compiled and linked in one command; split it, so liblink
# gets an object to archive
bld/wrap/cc/plugins/compile
{% endblock %}

{% block build %}
unset CLASSPATH
# the JDK's own make, as is: it runs its jobs itself (JOBS from configure);
# the AWT tools that make icons and swing bean infos need the native AWT
# this JDK and its boot JDK lack; there is no serviceability agent (see
# patch); the launchers get a soname, which makes them libraries to
# wrap_cc
make \
    TOOL_AWT_TOBIN=echo \
    GENSRC_SWING_BEANINFO= \
    USE_PRECOMPILED_HEADER=0 \
    INCLUDE_SA=false \
    SET_SHARED_LIBRARY_NAME= \
    {{self.jdk_targets().strip()}}
{% endblock %}

{% block jdk_targets %}
images
{% endblock %}

{% block script_init_env %}
export CLASSPATH=
{{super()}}
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
wrap_rdynamic
{% endblock %}

{% block cpp_defines %}
isnanf=isnan
CLONE_VM=0
CLONE_VFORK=0
SIGCLD=SIGCHLD
__SIGRTMAX=SIGRTMAX
HAS_GLIBC_GETHOSTBY_R=1
{% endblock %}

{% block c_flags %}
-Wno-implicit-function-declaration
# hotspot is not clean C++: it tests this against NULL, overflows signed
# ints and type-puns; with optimization clang would take all of it at face
# value
-fno-delete-null-pointer-checks
-fno-strict-aliasing
-fwrapv
{% endblock %}

{% block cxx_flags %}
-std=c++98
{% endblock %}

{% block ld_flags %}
# the launcher mapfiles still name Solaris-only symbols (__xargv, ...)
-Wl,--undefined-version
{% endblock %}

{% block configure_flags %}
--with-toolchain-type=clang
--with-jvm-variants=server
--disable-headful
# bld/java/8 keeps the JDK itself, jre/lib/rt.jar and all, one level down
--with-boot-jdk=${JAVA_HOME}/jvm/openjdk-1.8.0-internal
--with-zlib=system
--with-debug-level=release
--disable-debug-symbols
--disable-zip-debug-info
--with-milestone=fcs
--with-update-version=504
--with-build-number=b01
# a fixed build directory, whatever the target
--with-conf-name=release
{% if not native %}
# the config.sub of JDK 8 knows no musl; the libc is all the same to it
--openjdk-target={{target.gnu_arch}}-unknown-linux-gnu
BUILD_CC=${HOST_CC}
BUILD_CXX=${HOST_CXX}
{% endif %}
{% endblock %}

{% block patch %}
# libjvm is linked into the launchers: find java.home from the executable
base64 -d << EOF | patch -p1
{% include 'jvm_path.patch/base64' %}
EOF
# and hprof finds its prelude file next to libhprof the same way
base64 -d << EOF | patch -p1
{% include 'hprof_prelude.patch/base64' %}
EOF
# a mark word is an integer carried in a markOopDesc*: clang assumes the
# pointer is 8-aligned and folds every lock-bit test on value() into a
# constant; hide the provenance from it
sed -e 's|uintptr_t value() const { return (uintptr_t) this; }|uintptr_t value() const { uintptr_t v = (uintptr_t) this; __asm__("" : "+r"(v)); return v; }|' \
    -i hotspot/src/share/vm/oops/markOop.hpp
grep -q '__asm__("" : "+r"(v))' hotspot/src/share/vm/oops/markOop.hpp
# a shifted negative is no integral constant expression for clang
find hotspot -type f -name '*.hpp' | while read l; do
    sed -e 's|(-1) <<|((unsigned)(-1)) << |' -i ${l}
done
find jdk -type f -name '*.h' | while read l; do
    sed -e 's|(-1)<<|((unsigned)(-1)) << |' -i ${l}
done
# SIGRTMAX is a function call on musl, not a constant initializer
sed -e 's|.*static int sigWakeup.*|#define sigWakeup (__SIGRTMAX - 2)|' \
    -i jdk/src/solaris/native/java/net/linux_close.c
sed -e 's|.*fpu_control.*||' \
    -i hotspot/src/os/linux/vm/os_linux.cpp
# GNU as turns a prefetch with a negative offset into prfum, clang wants
# it spelled out
sed -e 's|prfm    pldl1keep, \[s, #-256\]|prfum   pldl1keep, [s, #-256]|' \
    -i hotspot/src/os_cpu/linux_aarch64/vm/copy_linux_aarch64.s
grep -q 'prfum' hotspot/src/os_cpu/linux_aarch64/vm/copy_linux_aarch64.s
# __u64 is a kernel type glibc's ucontext.h happens to bring in
sed -e 's|(__u64)stub|(uintptr_t)stub|' \
    -i hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp
# hotspot takes the clang version from the first "version" in clang -v,
# which here also prints the link line, --undefined-version and all
sed -e 's|$(CC) -v 2>&1 \| grep version \||$(CC) -v 2>\&1 \| grep "clang version" \||' \
    -i hotspot/make/linux/makefiles/gcc.make
grep -q 'grep "clang version"' hotspot/make/linux/makefiles/gcc.make
# without precompiled headers nothing brings in the template code this
# needs: an undefined symbol a shared libjvm would carry, the static
# link refuses
sed -e 's|^#include "memory/memRegion.hpp"|#include "memory/memRegion.hpp"\n#include "memory/allocation.inline.hpp"|' \
    -i hotspot/src/share/vm/jfr/leakprofiler/chains/bitset.cpp
grep -q 'allocation.inline.hpp' hotspot/src/share/vm/jfr/leakprofiler/chains/bitset.cpp
# no serviceability agent: libsaproc wants glibc's thread_db.h, and
# sa-jdi.jar is its Java half
rm -rf hotspot/agent
sed -e '/^EXPORT_LIST += \$(ADD_SA_BINARIES\/\$(HS_ARCH))$/d' \
    -i hotspot/make/linux/makefiles/defs.make
# the swing HTML DTD is generated by a tool that pulls in AWT, leave it
# empty
sed -e 's|(\$(TOOL_DTDBUILDER) .*html32 > \$@) \|\| exit 1|$(TOUCH) $@|' \
    -i jdk/make/gendata/GendataHtml32dtd.gmk
grep -q 'TOUCH' jdk/make/gendata/GendataHtml32dtd.gmk
# no native AWT, 2D or sound: they need the real X11 headers
>jdk/make/lib/Awt2dLibraries.gmk
>jdk/make/lib/SoundLibraries.gmk
# nor the X11 toolkit, whose wrappers are generated against real X11
# headers; nothing outside sun.awt.X11 depends on it
>jdk/make/gensrc/GensrcX11Wrappers.gmk
# (whose output directory the rest of the build still expects)
mkdir -p build/release/jdk/gensrc_no_srczip
find jdk/src/solaris/classes/sun/awt/X11 -type f -name '*.java' -delete
# GENSRC_SWING_BEANINFO is off: these two come out of the bean info tool
mkdir -p build/release/jdk/classes/javax/swing
>build/release/jdk/classes/javax/swing/SwingBeanInfoBase.class
mkdir -p build/release/jdk/classes/sun/swing
>build/release/jdk/classes/sun/swing/BeanInfoUtils.class
{% endblock %}

{# every native library the JDK ships, registered for dlopen; left out are
   jli, linked into the launchers, jsig, for LD_PRELOAD, and the JVMTI
   demos #}
{% block dl_libs %}
attach
dt_socket
hprof
instrument
j2gss
j2pcsc
j2pkcs11
jaas_unix
java
java_crw_demo
jdwp
jsdt
jvm
management
net
nio
npt
sctp
sunec
unpack
verify
zip
{% endblock %}

{% block dl_onload_libs %}
j2gss
j2pcsc
j2pkcs11
java
management
net
sctp
{% endblock %}

{# JVMTI agents, found by Agent_OnLoad/Agent_OnUnload like JNI libraries
   by JNI_OnLoad #}
{% block dl_agent_libs %}
hprof
instrument
jdwp
{% endblock %}
