{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/ninja-build/ninja/archive/refs/tags/v1.10.2.tar.gz
# md5 639f75bc2e3b19ab893eaf2c810d4eb4
{% endblock %}

{% block deps %}
# bld lib/cxx/mix.sh
# bld dev/lang/python/3/minimal/mix.sh
# bld dev/build/cmake/mix.sh
# bld env/std/mix.sh
{% endblock %}
