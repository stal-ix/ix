{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-11.2.0/gcc-11.2.0.tar.xz
31c86f2ced76acac66992eeedce2fce2
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
lib/c++/mix.sh
lib/isl/mix.sh
lib/gmp/mix.sh
lib/mpc/mix.sh
lib/intl/mix.sh
lib/mpfr/mix.sh
{% endblock %}

{% block bld_tool %}
gnu/tar/mix.sh
dev/lang/flex/mix.sh
dev/doc/texinfo/mix.sh
dev/lang/bison/3/8/mix.sh
tool/compress/gzip/mix.sh
dev/lang/binutils/mix.sh(for_target={{host.gnu.three}},bin_prefix=host)
dev/lang/binutils/mix.sh(for_target={{target.gnu.three}},bin_prefix=target)
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

export CC_FOR_TARGET=cc
export CXX_FOR_TARGET=c++

export AR=hostar
export AS=hostas
export LD=hostld
export NM=hostnm
export OBJCOPY=hostobjcopy
export OBJDUMP=hostobjdump
export RANLIB=hostranlib
export READELF=hostreadelf
export STRIP=hoststrip

export AR_FOR_TARGET=targetar
export AS_FOR_TARGET=targetas
export LD_FOR_TARGET=targetld
export NM_FOR_TARGET=targetnm
export OBJCOPY_FOR_TARGET=targetobjcopy
export OBJDUMP_FOR_TARGET=targetobjdump
export RANLIB_FOR_TARGET=targetranlib
export READELF_FOR_TARGET=targetreadelf
export STRIP_FOR_TARGET=targetstrip
{% endblock %}

{% block postinstall %}
{% endblock %}
