{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block purge_autohell %}configure{% endblock %}

{% block bld_libs %}
lib/c
lib/xml/2
lib/iconv
lib/unistring
lib/textstyle
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/byacc
{% endblock %}

{% block unpack %}
{{super()}}
cd gettext-tools
{% endblock %}

{% block configure_flags %}
--with-installed-libtextstyle
{% endblock %}
