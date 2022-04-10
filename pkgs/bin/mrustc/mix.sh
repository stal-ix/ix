{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/thepowersgang/mrustc/archive/refs/tags/v0.10.tar.gz
sha:a4e3aed0abb1c702923cfae7f616389b2f91b4e042e933db2e5002be949b42a7
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
