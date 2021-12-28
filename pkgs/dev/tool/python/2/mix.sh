{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz
fd6cc8ec0a78c44036f825e739f36e5a
{% endblock %}

{% block bld_libs %}
lib/python/libs(openssl=1)
{% endblock %}

{% block bld_tool %}
dev/tool/python
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
EOF
{% endblock %}

{% block configure_flags %}
--without-ensurepip
--libdir=${out}/share/python2
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD}/Modules/_io -I${PWD}/Modules/_ctypes -I${PWD}/Modules/expat ${CPPFLAGS}"
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
