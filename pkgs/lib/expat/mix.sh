{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_2_4_1.tar.gz
3bbf3f4d6a1ab1a82ca1dbafda68ed5f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
box/boot
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

{% block env %}
export COFLAGS="--with-expat=${out} --with-libexpat-prefix=${out} --with-libexpat=${out} --with-system-expat=yes \${COFLAGS}"
{% endblock %}
