{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/onetrueawk/awk/archive/refs/tags/20220122.tar.gz
sha:720a06ff8dcc12686a5176e8a4c74b1295753df816e38468a6cf077562d54042
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp a.out ${out}/bin/nawk
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
