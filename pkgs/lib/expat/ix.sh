{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_2_4_8.tar.gz
sha:122d8ae7a0170b9835cb45b216d856c1f83dd83792f8f0f80c31e98283efbe87
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd expat
{% endblock %}

{% block cmake_flags %}
EXPAT_BUILD_EXAMPLES=OFF
EXPAT_SHARED_LIBS=OFF
{% endblock %}

{% block setup_tools %}
cat << EOF > install_name_tool
EOF

chmod +x install_name_tool
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-expat=${out} --with-libexpat-prefix=${out} --with-libexpat=${out} --with-system-expat=yes \${COFLAGS}"
{% endblock %}
