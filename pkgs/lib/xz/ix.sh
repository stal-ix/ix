{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-xz
--disable-xzdec
--disable-scripts
--disable-lzmadec
--disable-lzmainfo
--disable-lzma-links
{% if wasi %}
--enable-threads=no
{% endif %}
{% endblock %}

{% block cpp_defines %}
{% if wasi %}
__wasilibc_unmodified_upstream=1
{% endif %}
{% endblock %}

{% block env %}
export COFLAGS="--with-lzma=${out} --with-liblzma-prefix=${out} \${COFLAGS}"
{% endblock %}
