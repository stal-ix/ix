{% extends '//die/c/make.sh' %}

{% block pkg_name %}
glibc
{% endblock %}

{% block version %}
2.43
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/glibc/glibc-{{self.version().strip()}}.tar.xz
d9c86c6b5dbddb43a3e08270c5844fc5177d19442cf5b8df4be7c07cd5fa3831
{% endblock %}

# glibc links libc.so/rtld with -lgcc for the compiler builtins; supply the
# freestanding compiler-rt builtins under that name. Build-only, so bld_libs.
{% block bld_libs %}
lib/kernel
lib/compiler_rt/builtins/libgcc
{% endblock %}

{% block bld_tool %}
bin/ld
bin/gzip
bld/perl
bld/bison
bld/python
bld/gettext
bld/fake/binutils
{% endblock %}

{% block build_flags %}
shut_up
no_werror
{% endblock %}

# glibc's configure requires real GNU ld/as; the ix clang env exports
# LD=clang (-fuse-ld=lld), which fails its "GNU ld" version check. clang
# stays the compiler (configure confirms it's sufficient), GNU binutils
# just does the linking.
{% block setup_target_flags %}
{{super()}}
export LD=ld
{% endblock %}

# glibc must be built out-of-tree; step_unpack persists cwd, so create the
# build dir here and the configure/build/install steps inherit it (source is ../src)
{% block step_unpack %}
{{super()}}
cd ..
mkdir obj
cd obj
{% endblock %}

# -fno-tree-loop-distribute-patterns is a GCC-only flag glibc hardcodes for
# mcount/rtld/tunables (to stop loop->memcpy/memset rewriting, critical in rtld
# which runs pre-relocation). clang's equivalent is -fno-builtin.
{% block patch %}
cd ../src
sed -i 's/-fno-tree-loop-distribute-patterns/-fno-builtin/g' gmon/Makefile elf/Makefile
{#
# the box ships zlib's minigzip as `gzip`, which only accepts a bare -9 (it parses
# -9n / -9vnc as filenames); rewrite glibc's locale/doc gzip calls accordingly.
# (only affects dst/usr/share, which this package drops)
sed -i 's/gzip -9n/gzip -9/g' localedata/Makefile
sed -i 's/gzip -9vnc/gzip -9 -c/g' Makerules
#}
{% endblock %}

{% block configure %}
../src/configure \
    --prefix=/usr \
    --with-headers=${KERNEL_HEADERS} \
    --enable-kernel=5.4 \
    --without-selinux \
    --without-gd \
    --disable-nscd \
    --disable-werror \
    libc_cv_slibdir=/usr/lib \
    libc_cv_rtlddir=/usr/lib
{% endblock %}

{% block build %}
make -j ${make_thrs} MAKEINFO=:
{% endblock %}

{% block install %}
make install install_root=${tmp}/dst MAKEINFO=:

mkdir -p ${out}/bin/usr
cp -a ${tmp}/dst/usr/lib ${out}/bin/usr/
cp -L ${tmp}/dst/usr/lib/ld-linux-x86-64.so.2 ${out}/bin/ld-linux.so.2

# this package only ships the runtime loader + shared libs for the prebuilt
# claude binary; drop the link-time-only artifacts: the static archives and the
# libc.so/libm.so GNU ld linker scripts that just GROUP() those archives. removing
# them leaves every remaining regular *.so* a real ELF object.
find ${out}/bin/usr/lib -name '*.a' -delete
rm -f ${out}/bin/usr/lib/libc.so ${out}/bin/usr/lib/libm.so

# strip the shared objects and the loader: removes .symtab/debug, keeps .dynsym
# (required for dynamic linking). shrinks libc.so.6 ~9MB -> ~2MB.
find ${out}/bin/usr/lib -type f -name '*.so*' -exec llvm-strip {} +
llvm-strip ${out}/bin/ld-linux.so.2
{% endblock %}

{% block postinstall %}
:
{% endblock %}
