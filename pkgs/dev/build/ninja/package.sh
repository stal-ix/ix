{% extends '//util/cmake.sh' %}

{% block fetch %}
# url https://github.com/ninja-build/ninja/archive/refs/tags/v1.10.2.tar.gz
# md5 639f75bc2e3b19ab893eaf2c810d4eb4
{% endblock %}

{% block deps %}
# bld lib/cxx dev/lang/python3 dev/build/cmake env/std
{% endblock %}

{% block cmflags %}
..
{% endblock %}
