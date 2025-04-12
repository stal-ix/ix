{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libpng
{% endblock %}

{% block version %}
1.6.44
{% endblock %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:0ef5b633d0c65f780c4fced27ff832998e71478c13b45dfb6e94f23a82f64f7c
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}
