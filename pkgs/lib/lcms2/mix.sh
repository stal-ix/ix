{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/mm2/Little-CMS/archive/refs/tags/lcms2.12.tar.gz
0359f600f305143c5457dd075d23bf07
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
libtoolize -c
autoreconf -i
{% endblock %}
