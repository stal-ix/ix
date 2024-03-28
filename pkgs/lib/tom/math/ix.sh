{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/libtom/libtommath/releases/download/v1.3.0/ltm-1.3.0.tar.xz
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
