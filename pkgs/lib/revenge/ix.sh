{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/libwpd/librevenge/librevenge-0.0.4/librevenge-0.0.4.tar.xz
sha:933f0729f04267cc354b9a02bc3e9afefa5512a3bdd0b45f159ee14a3e3347b2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/boost
{% endblock %}

{% block configure_flags %}
--disable-werror
--disable-tests
{% endblock %}
