{% extends '//die/c/make.sh' %}

{% block pkg_name %}
iotop
{% endblock %}

{% block version %}
1.26
{% endblock %}

{% block fetch %}
https://github.com/Tomas-M/iotop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:b0a334cba89249bc7cbb87cf92cf4166911bf00dd2ea8841b572fd776018c487
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/curses
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
