{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v1.6.42.tar.gz
sha:fe89de292e223829859d21990d9c4d6b7e30e295a268f6a53a022611aa98bd67
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}
