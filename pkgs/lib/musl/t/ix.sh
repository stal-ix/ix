{% extends '//die/c/configure.sh' %}

{% block pkg_name %}
musl
{% endblock %}

{% block version %}
1.2.5
{% endblock %}

{% block fetch %}
http://musl.libc.org/releases/musl-{{self.version().strip()}}.tar.gz
a9a118bbe84d8764da0ea0d28b3ab3fae8477fc7e4085d90102b8596fc7c75e4
{% endblock %}

{% block lib_deps %}
lib/build
lib/musl/env
{% endblock %}

{% block std_box %}
{{super()}}
{% if sanitize %}
bld/redefiner
{% endif %}
{% endblock %}

{% block configure_script %}
./configure
{% endblock %}

{% block configure_flags %}
--target={{target.gnu.three}}
--host={{target.gnu.three}}
--build={{host.gnu.three}}
--enable-static
--disable-shared
{% endblock %}

{% block setup_target_flags %}
export PICFLAGS="-fno-pic -fno-pie"
export CPPFLAGS="${PICFLAGS} ${CPPFLAGS}"
{% if sanitize == 'address' %}
{#
Avoid instrumenting libc initialization functions that
are called before the shadow memory is initialized.
#}
>no_sanitize.txt
for file in __init_tls __libc_start_main __stack_chk_fail crt1
do
  echo "src:*/${file}.c" >>no_sanitize.txt
done
{#
Also, the Address Sanitizer runtime wants to call `{get,set}rlimit()`
during the initialization for various reasons. This happens
before the shadow memory is set up, so we need to use non-instrumented
versions of these functions.
#}
for func in getrlimit setrlimit
do
  echo "fun:${func}" >>no_sanitize.txt
done
export CPPFLAGS="-fsanitize-ignorelist=${PWD}/no_sanitize.txt ${CPPFLAGS}"
{% endif %}
{% endblock %}

{% block patch %}
cat << EOF > src/stdlib/dso_handle.c
void* __dso_handle = (void*)&__dso_handle;
EOF
{% if sanitize == 'address' %}
{#
String functions in musl intentionally do OOB reads:
https://inbox.vuxu.org/musl/20160105164640.GL23362@port70.net/
This is obviously a problem for Address Sanitizer.
Thankfully, the problematic patterns are gated with `__GNUC__`,
so we can disable them here.
#}
for file in memccpy memchr stpcpy stpncpy strchrnul strlcpy strlen
do
  sed -i \
    's/#ifdef __GNUC__/#ifdef PLZ_NO_UNSAFE_SHENANIGANS/' \
    src/string/${file}.c
done
{% endif %}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
ar q libcrt.a crt1.o crti.o crtn.o
ranlib libcrt.a
{% if sanitize %}
ls ${out}/lib/*.a ${out}/lib/*.o | while read l; do
    ix_redefiner ${l} ${IX_SANITIZER_INTERCEPT}
done
{% endif %}
{% endblock %}

{% block env %}
export CMFLAGS="-DLIBCXX_HAS_MUSL_LIBC=yes \${CMFLAGS}"
export CPPFLAGS="${PICFLAGS} -D_LARGEFILE64_SOURCE=1 -isystem ${out}/include \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}
