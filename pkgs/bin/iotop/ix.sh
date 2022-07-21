{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/Tomas-M/iotop/archive/refs/tags/v1.22.tar.gz
sha:fd7fc79a3bb96a33dc370ff2982ebed2e96b10580786ed7a529b15c6b64b2912
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/curses
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
