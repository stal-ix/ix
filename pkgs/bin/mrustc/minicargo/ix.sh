{% extends '//die/c/make.sh' %}

{% block fetch %}
{% include '//bin/mrustc/t/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
{% endblock %}

{% block build %}
make -j ${make_thrs} -C tools/minicargo
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
cp bin/minicargo ${out}/bin/
{% endblock %}
