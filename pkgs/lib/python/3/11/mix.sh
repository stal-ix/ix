{% extends '//lib/python/3/10/mix.sh' %}

{% block fetch %}
https://github.com/python/cpython/archive/refs/tags/v3.11.0a2.tar.gz
f21d7c326ca389e43caf5664a768d745
{% endblock %}

{% block bld_deps %}
dev/build/python/mix.sh
{{super()}}
{% endblock %}

{% block setup %}
{{super()}}
export CPPFLAGS="-DCONFIG_64=1 -DSQLITE_OMIT_LOAD_EXTENSION=1 ${CPPFLAGS}"
{% endblock %}

{% block ensure_static_build %}
base64 -d << EOF > fix.py
{% include 'fix.py/base64' %}
EOF

cat Modules/Setup \
    | python3 fix.py      \
    | grep -v capi        \
    | grep -v nis         \
    | grep -v spwd        \
    | grep -v pyexpat     \
    | grep -v _decimal    \
    | grep -v xxsubtype   \
    | grep -v _dbmmodule  \
    | grep -v ossaudiodev \
    > _

cat _ - << EOF > Modules/Setup.local
_decimal _decimal/_decimal.c
{{'_scproxy _scproxy.c' | darwin}}
pyexpat pyexpat.c
EOF
{% endblock %}

{% block test %}
{{super()}}
${out}/bin/python3 -c 'import pyexpat'
{% endblock %}
