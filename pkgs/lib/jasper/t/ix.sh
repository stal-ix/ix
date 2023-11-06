{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/jasper-software/jasper/archive/refs/tags/version-4.0.1.tar.gz
sha:a251eae29c90ccae4757a051a795c456ff1218da0a180e3eb2ab8427c5f1d31d
{% endblock %}

{% block lib_deps %}
lib/c
lib/heif
lib/jpeg
{% endblock %}

{% block cmake_flags %}
JAS_CROSSCOMPILING=ON
JAS_STDC_VERSION=201112L
{% endblock %}
