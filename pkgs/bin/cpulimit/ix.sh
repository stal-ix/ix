{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/opsengine/cpulimit/archive/refs/tags/v0.2.tar.gz
sha:64312f9ac569ddcadb615593cd002c94b76e93a0d4625d3ce1abb49e08e2c2da
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block patch %}
sed -e 's|.*sys.*sysctl.*||' -i src/cpulimit.c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp src/cpulimit ${out}/bin/
{% endblock %}
