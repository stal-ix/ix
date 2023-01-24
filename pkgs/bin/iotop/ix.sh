{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/Tomas-M/iotop/archive/refs/tags/v1.23.tar.gz
sha:a2a620841f0c49caba590a730a15a546464e4aa337bbaa018eb7b6c92bc7a738
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
