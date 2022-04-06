{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/haikarainen/light/archive/refs/tags/v1.2.2.tar.gz
sha:62e889ee9be80fe808a972ef4981acc39e83a20f9a84a66a82cd1f623c868d9c
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block setup %}
export CFLAGS="-fcommon ${CFLAGS}"
{% endblock %}

{% block configure_flags %}
--with-udev
{% endblock %}
