{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_2_4_5.tar.gz
sha:c53865ca8bb7159500ab819ee141eb30da56277b9921047f800b633ae8e5f12c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
bld/bootbox
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
