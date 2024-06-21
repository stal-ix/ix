{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxslt/-/archive/v1.1.41/libxslt-v1.1.41.tar.bz2
sha:addd5e812fd9697d4ef00adc44b7bae54249d84663b8519a0311a2ef5e09ae06
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml/2
{% endblock %}

{% block configure_flags %}
--with-python=no
--without-python
{% endblock %}
