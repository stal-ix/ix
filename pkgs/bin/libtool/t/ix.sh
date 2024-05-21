{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftpmirror.gnu.org/libtool/libtool-2.4.7.tar.gz
sha:04e96c2404ea70c590c546eba4202a4e12722c640016c12b9b2f1ce3d481e9a8
{% endblock %}

{% block bld_tool %}
bld/m4
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
