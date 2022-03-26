{% extends '//mix/c_std.sh' %}

{% block fetch %}
https://github.com/g-truc/glm/archive/refs/tags/0.9.9.8.tar.gz
sha:7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
mkdir -p ${out}/include ${out}/lib/pkgconfig
cp -R glm ${out}/include/

cat << EOF > ${out}/lib/pkgconfig/glm.pc
prefix=${out}
includedir=\${prefix}/include

Name: GLM
Description: GLM devs completely insane, so this shit
Version: 0.9.9.9
Cflags: -I\${includedir}
EOF
{% endblock %}
