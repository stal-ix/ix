{% extends '//die/c/pmake.sh' %}

{% block version %}
0.9.1
{% endblock %}

{% block pkg_name %}
gbsddialog
{% endblock %}

{% block fetch %}
https://github.com/khorben/gbsddialog/archive/refs/tags/gbsddialog_{{self.version().strip().replace('.', '-')}}.tar.gz
sha:95bc5e57d09a26f2ba5529c82e63b71249f3ea2ba288d9c8cea4895a14877fdb
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
find . -type f -name '*.c' | while read l; do
    sed -e 's|DISPLAY|WAYLAND_DISPLAY|' -i ${l}
done
{% endblock %}
