{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v1.6.44.tar.gz
sha:0ef5b633d0c65f780c4fced27ff832998e71478c13b45dfb6e94f23a82f64f7c
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}
