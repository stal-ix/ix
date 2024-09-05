{% extends '//lib/ng/http/2/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-lib-only
{% endblock %}

{% block cpp_defines %}
{{super()}}
NGHTTP2_STATICLIB=1
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
export CPPFLAGS="-DNGHTTP2_STATICLIB=1 \${CPPFLAGS}"
export COFLAGS="--with-nghttp2=${out} --with-libnghttp2=${out} \${COFLAGS}"
{% endblock %}
