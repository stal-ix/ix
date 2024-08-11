{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://www.libssh.org/files/0.11/libssh-0.11.0.tar.xz
sha:860e814579e7606f3fc3db98c5807bef2ab60f793ec871d81bcd23acdcdd3e91
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
lib/openssl
{% endblock %}

{% block env %}
export COFLAGS="--with-libssh=${out} \${COFLAGS}"
{% endblock %}

{% block cmake_flags %}
WITH_EXAMPLES=OFF
WITH_DEBUG_CALLTRACE=OFF
WITH_SYMBOL_VERSIONING=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|OpenSSL::Crypto|c|' \
    -i ${out}/lib/cmake/libssh/libssh-config.cmake
{% endblock %}
