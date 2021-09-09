# dep boot/final/cmake boot/final/python boot/final/env
# run env/clang
{% extends '//util/build_clang.sh' %}

{% block prebuild %}
rm sh
{% include '//util/build_libcxx.sh' %}
{% endblock %}
