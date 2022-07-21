{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/biojppm/rapidyaml/archive/refs/tags/v0.4.1.tar.gz
#sha:b4ef0300b5899ede26ed529d8a8daa3347810693957707dbe522f69b17250ae2
https://github.com/biojppm/rapidyaml/releases/download/v0.4.1/rapidyaml-0.4.1-src.tgz
sha:3c0a671a7a5aab972f7d259736d14beb9f428c4441f0c220dc0717a4946b495c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/scripts/fakegit
{% endblock %}
