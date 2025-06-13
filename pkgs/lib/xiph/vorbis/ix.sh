{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
vorbis
{% endblock %}

{% block version %}
1.3.7
{% endblock %}

{% block fetch %}
https://gitlab.xiph.org/xiph/vorbis/-/archive/v{{self.version().strip()}}/vorbis-v{{self.version().strip()}}.tar.bz2
db12631bedae30342304625d43cd8ec45462a3309087021ca3452b738e34981f
{% endblock %}

{% block lib_deps %}
lib/c
lib/xiph/ogg
{% endblock %}
