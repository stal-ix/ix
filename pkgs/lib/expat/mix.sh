{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_2_4_1.tar.gz
3bbf3f4d6a1ab1a82ca1dbafda68ed5f
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block unpack %}
{{super()}}
cd expat
{% endblock %}

{% block cmake_flags %}
-DEXPAT_BUILD_EXAMPLES=OFF
-DEXPAT_SHARED_LIBS=OFF
{% endblock %}

{% block setup_tools %}
cat << EOF > install_name_tool
EOF

chmod +x install_name_tool
{% endblock %}

{% block env %}
export COFLAGS="--with-expat=${out} --with-libexpat-prefix=${out} --with-libexpat=${out} --with-system-expat=yes \${COFLAGS}"
{% endblock %}
