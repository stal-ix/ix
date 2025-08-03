{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
plutovg
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block fetch %}
https://github.com/sammycage/plutovg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4b08587d782f6858e6cb815b455fd7238f45190a57094857a3123883ecb595eb
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/plutovg \${CPPFLAGS}"
{% endblock %}
