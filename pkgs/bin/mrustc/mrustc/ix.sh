{% extends '//die/c/make.sh' %}

{% block fetch %}
{% include '//bin/mrustc/t/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
{% endblock %}

{% block bld_tool %}
bld/bash
bld/fake(tool_name=git)
bld/fake(tool_name=objcopy)
{% endblock %}

{% block make_target %}
bin/mrustc
{% endblock %}

{% block make_flags %}
V=
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/mrustc ${out}/bin/
{% endblock %}

{% block patch %}
sed -e 's|g_target.m_env_name|"musl"|' -i src/trans/target.cpp
{% endblock %}
