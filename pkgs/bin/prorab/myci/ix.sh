{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cppfw/myci/archive/refs/tags/0.1.147.tar.gz
sha:1ab8a33005130b84ca7b7f4a7faca7540cff2a02421e06631c1d3c8893fde334
{% endblock %}

{% block bld_tool %}
bin/prorab/base
bin/prorab/extra
{% endblock %}

{% block make_flags %}
-I ${PRORAB_DIR}
-I ${PRORAB_EXTRA_DIR}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
for x in *.sh; do
    sed -e 's|/bin/bash|/usr/bin/env bash|' -i ${x}
done
{% endblock %}
