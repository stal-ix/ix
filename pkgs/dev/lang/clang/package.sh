# dep boot/final/cmake boot/final/python boot/final/env/full
# dep lib/linux
# run env/clang
{% extends '//util/build_clang.sh' %}

{% block prebuild %}
{% include '//util/build_libcxx.sh' %}
{% endblock %}
