{% extends '//lib/xz/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-xz
--disable-xzdec
--disable-scripts
--disable-lzmadec
--disable-lzmainfo
--disable-lzma-links
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/slibtool
{% endblock %}

{% block make_flags %}
{{super()}}
LIBTOOL=slibtool-static
{% endblock %}

{% block env %}
export COFLAGS="--with-lzma=${out} --with-liblzma-prefix=${out} \${COFLAGS}"
{% endblock %}
