{% extends '//bin/bmake/t/mix.sh' %}

{% block make_tool %}
bld/bmake
{% endblock %}

{% block make_bin %}
bmake -f Makefile
{% endblock %}

{% block make_flags %}
MK_AUTOCONF_MK=no
INSTALL=install
{% endblock %}
