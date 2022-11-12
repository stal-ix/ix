{% extends '//die/c/make.sh' %}

{% block fetch %}
{% include '//bin/mrustc/t/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
{% endblock %}

{% block build %}
make -j ${make_thrs} bin/mrustc
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup_tools %}
cat << EOF > objcopy
#!/usr/bin/env sh
EOF

chmod +x objcopy
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/mrustc ${out}/bin/
{% endblock %}

{% block patch %}
sed -e 's|g_target.m_env_name|"musl"|' -i src/trans/target.cpp
{% endblock %}
