# dep boot/final/cmake boot/final/python boot/final/env
{% extends '//util/build_clang.sh' %}

{% block prebuild %}
rm sh
{% include '//util/build_libcxx.sh' %}
{% endblock %}
