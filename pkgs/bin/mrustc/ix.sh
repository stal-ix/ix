{% extends '//die/make.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
{% endblock %}

{% block build %}
make -j ${make_thrs} bin/mrustc
make -C tools/minicargo -j ${make_thrs}
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/bash
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
cp bin/minicargo ${out}/bin/
{% endblock %}

{% block patch %}
sed -e 's|g_target.m_env_name|"musl"|' -i src/trans/target.cpp
{% endblock %}
