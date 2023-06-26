{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-xz
--disable-xzdec
--disable-scripts
--disable-lzmadec
--disable-lzmainfo
--disable-lzma-links
{% endblock %}

{% block env %}
export COFLAGS="--with-lzma=${out} --with-liblzma-prefix=${out} \${COFLAGS}"
{% endblock %}
