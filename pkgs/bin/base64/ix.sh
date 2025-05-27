{% extends '//die/c/make.sh' %}

{% block pkg_name %}
base64-aklomp
{% endblock %}

{% block version %}
0.5.2
{% endblock %}

{% block fetch %}
https://github.com/aklomp/base64/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:723a0f9f4cf44cf79e97bcc315ec8f85e52eb104c8882942c3f2fba95acc080d
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=objcopy)
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_target %}
bin/base64
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/base64 ${out}/bin/
{% endblock %}
