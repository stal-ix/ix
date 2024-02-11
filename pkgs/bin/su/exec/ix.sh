{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/ncopa/su-exec/archive/refs/tags/v0.2.tar.gz
sha:ec4acbd8cde6ceeb2be67eda1f46c709758af6db35cacbcde41baac349855e25
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp su-exec ${out}/bin/
{% endblock %}
