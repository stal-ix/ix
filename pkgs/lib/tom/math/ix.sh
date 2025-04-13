{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libtommath
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block fetch %}
https://github.com/libtom/libtommath/releases/download/v{{self.version().strip()}}/ltm-{{self.version().strip()}}.tar.xz
sha:296272d93435991308eb73607600c034b558807a07e829e751142e65ccfa9d08
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
{% if darwin %}
shut_up
{% endif %}
{% endblock %}
