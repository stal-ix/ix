{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libtommath
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block fetch %}
https://github.com/libtom/libtommath/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6d099e93ff00fa9b18346f4bcd97dcc48c3e91286f7e16c4ac5515a7171c3149
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
{% if darwin %}
shut_up
{% endif %}
{% endblock %}
