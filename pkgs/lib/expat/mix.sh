{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/libexpat/libexpat/archive/refs/tags/R_2_4_1.tar.gz
3bbf3f4d6a1ab1a82ca1dbafda68ed5f
{% endblock %}

{% block bld_deps %}
env/std/0/mix.sh
{% endblock %}

{% block postunpack %}
cd expat
{% endblock %}

{% block cmflags %}
-DEXPAT_BUILD_EXAMPLES=OFF
-DEXPAT_SHARED_LIBS=OFF
{% endblock %}

{% block toolconf %}
cat << EOF > install_name_tool
EOF

chmod +x install_name_tool
{% endblock %}

{% block env %}
export COFLAGS="--with-expat=${out} --with-libexpat-prefix=${out} \${COFLAGS}"
export CMFLAGS="-DCMAKE_USE_SYSTEM_EXPAT=ON \${CMFLAGS}"
{% endblock %}
