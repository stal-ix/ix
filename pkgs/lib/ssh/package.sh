{% extends '//util/cmake.sh' %}

{% block fetch %}
# url https://www.libssh.org/files/0.9/libssh-0.9.5.tar.xz
# md5 6211e47ba4dfd7f7e9f8a17a601245f4
{% endblock %}

{% block deps %}
# lib lib/z lib/cxx lib/openssl
# bld dev/build/cmake env/std
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lssh \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
{% endblock %}
