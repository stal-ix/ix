{% extends '//die/c/meson.sh' %}

{% block version %}
0.3.0
{% endblock %}

{% block fetch %}
https://nheko.im/nheko-reborn/coeurl/-/archive/v{{self.version().strip()}}/coeurl-v{{self.version().strip()}}.tar.bz2
sha:a80f0cb449df5719c70ce34a00a95191c1e27f79ec6bef1e72be5d4d97c95f9d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/fmt
lib/curl
lib/event
lib/spdlog
{% endblock %}
