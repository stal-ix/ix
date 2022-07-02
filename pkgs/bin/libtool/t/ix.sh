{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz
sha:e3bd4d5d3d025a36c21dd6af7ea818a2afcd4dfc1ea5a17b39d7854bcd0c06e3
{% endblock %}

{% block bld_tool %}
bld/m4
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
