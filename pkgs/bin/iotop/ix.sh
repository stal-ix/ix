{% extends '//die/c/make.sh' %}

{% block pkg_name %}
iotop
{% endblock %}

{% block version %}
1.29
{% endblock %}

{% block fetch %}
https://github.com/Tomas-M/iotop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:8afcd3f2a91a5246c4b187e39cb87fafdb5c2dd27a0386fb8381361c271f8f60
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
