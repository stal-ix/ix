{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-11.2.0/gcc-11.2.0.tar.xz
31c86f2ced76acac66992eeedce2fce2
{% endblock %}

{% block bld_libs %}
lib/z
lib/c
lib/c++
lib/isl
lib/gmp
lib/mpc
lib/intl
lib/mpfr
{% endblock %}

{% set t %}{{target.gnu.three}}{% endset %}
{% set f %}{{for_target or target.gnu.three}}{% endset %}

{% block bld_tool %}
gnu/tar
dev/lang/flex
bin/texinfo
dev/lang/bison/3/8
tool/compress/gzip
dev/lang/binutils(for_target={{t}},bin_prefix={{t}})
dev/lang/binutils(for_target={{f}},bin_prefix={{f}})
{% endblock %}

{% block configure_flags %}
--with-system-zlib

--enable-lto=no
--disable-lto
--disable-libstdcxx
--disable-multilib
--disable-bootstrap

--enable-serial-host
--enable-serial-target
--enable-serial-build

--enable-languages=c,c++

--with-static-standard-libraries=yes
{% endblock %}

{% block make_verbose %}
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
export acx_cv_cc_gcc_supports_ada=no

export AR={{t}}ar
export AS={{t}}as
export LD={{t}}ld
export NM={{t}}nm
export OBJCOPY={{t}}objcopy
export OBJDUMP={{t}}objdump
export RANLIB={{t}}ranlib
export READELF={{t}}readelf
export STRIP={{t}}strip

export AR_FOR_TARGET={{f}}ar
export AS_FOR_TARGET={{f}}as
export LD_FOR_TARGET={{f}}ld
export NM_FOR_TARGET={{f}}nm
export OBJCOPY_FOR_TARGET={{f}}objcopy
export OBJDUMP_FOR_TARGET={{f}}objdump
export RANLIB_FOR_TARGET={{f}}ranlib
export READELF_FOR_TARGET={{f}}readelf
export STRIP_FOR_TARGET={{f}}strip
{% endblock %}

{% block setup_compiler %}
{{super()}}

# TODO(pg): provide real for-target compiler
export CC_FOR_TARGET=${CC}
export CXX_FOR_TARGET=${CXX}
{% endblock %}

{% block postinstall %}
echo 'FIXME(pg): proper(shared/) headers location'
{% endblock %}
