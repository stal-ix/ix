{% extends '//die/c/pmake.sh' %}

{% block fetch %}
https://github.com/khorben/gbsddialog/archive/refs/tags/gbsddialog_0-9-0.tar.gz
sha:b10d7b7eec643b3246d494c0b2275180ea2606839f82741a24cafa3649a74631
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/pkg/config
{% endblock %}

{% block patch %}
sed -e 's|addr.sun_len =|int x =|' -i src/gbsddialog.c
{% endblock %}
