{% extends '//die/c/make.sh' %}

{% block pkg_name %}
iotop
{% endblock %}

{% block version %}
1.31
{% endblock %}

{% block fetch %}
https://github.com/Tomas-M/iotop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
658a615eb1def9dddcf0c325efebb4f78b101a040fff33ef7afaaa39c2471669
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
