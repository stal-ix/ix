{% extends '//lib/lua/puc/5/t/ix.sh' %}

{% block pkg_name %}
lua
{% endblock %}

{% block version %}
5.5.1
{% endblock %}

{% block fetch %}
https://www.lua.org/ftp/lua-{{self.version().strip()}}.tar.gz
1c4b4068d67061f2a2231ad2b5422e77acea1487ea9890f6320af614f4373dce
{% endblock %}

{% block install %}
{{super()}}
mkdir -p ${out}/lib/pkgconfig
cat << EOF > ${out}/lib/pkgconfig/lua55.pc
prefix=${out}
libdir=\${prefix}/lib
includedir=\${prefix}/include

Name: lua
Description: Lua language engine
Version: {{self.version().strip()}}
Libs: -L\${libdir} -llua
Cflags: -I\${includedir}
EOF
{% endblock %}
