{% extends 't/ix.sh' %}

{% block cmake_flags %}
ENABLE_LIB_ONLY=ON
{{super()}}
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
sf_base64decode
sf_parser_dict
sf_parser_init
sf_parser_inner_list
sf_parser_item
sf_parser_list
sf_parser_param
sf_unescape
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-DNGHTTP3_STATICLIB=1 \${CPPFLAGS}"
export COFLAGS="--with-nghttp3=${out} \${COFLAGS}"
{% endblock %}
