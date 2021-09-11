# dep {{mix.if_linux('lib/linux')}} boot/final/cxx boot/final/env
# run env/clang
{% extends '//util/build_clang.sh' %}

{% block prebuild %}
{% include '//util/build_libcxx.sh' %}
{% endblock %}
