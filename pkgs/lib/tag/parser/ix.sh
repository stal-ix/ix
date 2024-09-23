{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Martchus/tagparser/archive/refs/tags/v12.3.1.tar.gz
sha:16cbf52cdf7c996d77c9c5b5487177515329ce9c3f5e68d1bb19ae4a8f49fb1c
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/openssl
lib/c++/utilities
{% endblock %}

{% block use_data %}
aux/iso/codes
{% endblock %}

{% block patch %}
sed -e "s|/usr|${ISO_CODES}|" -i cmake/scripts/generate_iso_language_codes.cmake
{% endblock %}
