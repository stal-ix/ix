{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libb64
{% endblock %}

{% block version %}
2.0.0.1
{% endblock %}

{% block fetch %}
https://github.com/libb64/libb64/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ce8e578a953a591bd4a6f157eec310b9a4c2e6f10ade2fdda6ae6bafaf798b98
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block patch %}
# 2.0.0.1 ships a typo that clang rejects
sed -e 's|#elseif|#elif|' -i include/b64/ccommon.h
{% endblock %}

{% block make_target %}
all_src
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp src/libb64.a ${out}/lib/
cp -R include ${out}/
{% endblock %}
