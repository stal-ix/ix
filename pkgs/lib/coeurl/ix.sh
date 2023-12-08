{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://nheko.im/nheko-reborn/coeurl/-/archive/v0.3.0/coeurl-v0.3.0.tar.bz2
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
