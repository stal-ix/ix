{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Martchus/tagparser/archive/refs/tags/v11.2.1.tar.gz
sha:daa881d2416bdcfac5c086b5e8ce780103477cf6bc11e71d75798f5ba5422c65
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/openssl
lib/c++/utilities
{% endblock %}

{% block run_data %}
aux/iso-codes
{% endblock %}

{% block bld_data %}
aux/iso-codes
{% endblock %}

{% block patch %}
sed -e "s|/usr|${aux_iso_codes}|" -i cmake/scripts/generate_iso_language_codes.cmake
{% endblock %}
