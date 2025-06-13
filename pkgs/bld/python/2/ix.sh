{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
python2
{% endblock %}

{% block version %}
2.7.18
{% endblock %}

{% block fetch %}
https://www.python.org/ftp/python/{{self.version().strip()}}/Python-{{self.version().strip()}}.tar.xz
sha:b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43
{% endblock %}

{% block bld_libs %}
lib/python/libs
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block patch %}
>setup.py

base64 -d << EOF > fix.py
{% include 'fix.py/base64' %}
EOF

cat Modules/Setup.dist \
    | python3 fix.py   \
    | grep -v audio    \
    | grep -v fpectl   \
    | grep -v readline \
    | grep -v Makefile \
    | grep -v sourcefi \
    | grep -v included \
    | grep -v _pickle  \
    | grep -v nismodul \
    | grep -v imgfile  \
    | grep -v cdmodule \
    | grep -v almodule \
    | grep -v clmodule \
    | grep -v sgimodul \
    | grep -v svmodule \
    | grep -v dbmmodul \
    | grep -v _bsddb   \
    | grep -v '='      \
    > Modules/Setup.local

cat << EOF >> Modules/Setup.local
_ssl _ssl.c
_hashlib _hashopenssl.c
_multiprocessing _multiprocessing/multiprocessing.c _multiprocessing/socket_connection.c _multiprocessing/semaphore.c
EOF
{% endblock %}

{% block configure_flags %}
--with-system-ffi
--without-ensurepip
#--libdir=${out}/share/python2
{% endblock %}

{% block cpp_includes %}
${PWD}/Modules/_io
${PWD}/Modules/expat
${PWD}/Modules/_ctypes
{% endblock %}

{% block install %}
{{super()}}

find ${out}/ | grep '\.[ao]$' | xargs rm
find ${out}/ | grep '\.pyc' | xargs rm

rm -rf ${out}/share/python2/pkgconfig
rm -rf ${out}/include

rm ${out}/bin/python
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): FIXME side lib dir'
{% endblock %}
