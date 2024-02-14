{% extends '//lib/python/3/10/ix.sh' %}

{% block fetch %}
https://github.com/python/cpython/archive/refs/tags/v3.11.8.tar.gz
sha:a3ab44f08e52ce619aea4ea405cc3d9f040fec0d048d99ed96921c149a2cc3b5
{% endblock %}

{% block bld_tool %}
bld/python
{{super()}}
{% endblock %}

{% block cpp_defines %}
{{super()}}
CONFIG_64=1
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export ax_cv_c_float_words_bigendian=no
{% endblock %}

{% block patch %}
{{super()}}

cd Modules/_ctypes

cat cfield.c \
    | grep -v 'ffi_type ffi_type_s' \
    | grep -v 'ffi_type ffi_type_u' \
    | grep -v 'ffi_type ffi_type_d' \
    | grep -v 'ffi_type ffi_type_f' \
    | grep -v 'ffi_type ffi_type_v' \
    | grep -v 'ffi_type ffi_type_p' \
    | grep -v 'ffi_type ffi_type_l' \
    | grep -v 'FFI_TYPE_LONGDOUBLE };' > _ && mv _ cfield.c
{% endblock %}

{% block ensure_static_build %}
base64 -d << EOF > fix.py
{% include 'fix.py/base64' %}
EOF

cat Modules/Setup \
    | python3 fix.py      \
{% if darwin %}
    | sed -e 's|cfield.c|cfield.c _ctypes/malloc_closure.c|' \
{% endif %}
    | grep -v capi        \
    | grep -v nis         \
    | grep -v spwd        \
    | grep -v pyexpat     \
    | grep -v _decimal    \
    | grep -v xxsubtype   \
    | grep -v ossaudiodev \
    | grep -v _uuidmodule \
    > _

cat Modules/Setup.stdlib.in \
    | grep _sql             \
    | sed -e 's|.*@||g'     \
    >> _

cat _ - << EOF > Modules/Setup.local
_decimal _decimal/_decimal.c
{% if darwin %}
_scproxy _scproxy.c
{% endif %}
pyexpat pyexpat.c
EOF
{% endblock %}
