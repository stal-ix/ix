{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/open-source-parsers/jsoncpp/archive/refs/tags/1.9.5.tar.gz
sha:f409856e5920c18d0c2fb85276e24ee607d2a09b5e7d5f0a371368903c275da2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
