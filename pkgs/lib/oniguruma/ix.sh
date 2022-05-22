{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/kkos/oniguruma/archive/refs/tags/v6.9.8.tar.gz
sha:26372720bab6733c869a9eb69377f73971138dc5e3eff4a81f5ba8aea5435fb2
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-onig=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
