{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://common-lisp.net/project/ecl/static/files/release/ecl-23.9.9.tgz
sha:c51bdab4ca6c1173dd3fe9cfe9727bcefb97bb0a3d6434b627ca6bdaeb33f880
{% endblock %}

{% block bld_libs %}
lib/c
lib/gmp
lib/ffi
lib/boehmgc
{% endblock %}

{% block unpack %}
{{super()}}
mkdir build
cd build
{% endblock %}

{% block configure_script %}
../src/configure
{% endblock %}

{% block configure_flags %}
--enable-threads=yes
--enable-libatomic=system
--enable-gmp=system
--enable-boehm=yes
--srcdir="${PWD}/../src"
{% endblock %}
