{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://gitlab.xiph.org/xiph/ogg/-/archive/v1.3.5/ogg-v1.3.5.tar.bz2
b1221346a0ed6b6369f8c69a2800050b
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}
