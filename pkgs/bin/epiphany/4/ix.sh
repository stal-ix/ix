{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/refs/tags/44.0.tar.gz
sha:c89ca15b30932b308735aab3e502a94fe9dc361f2d226a4d21cb4af0ceb2db9d
{% endblock %}

{% block bld_libs %}
lib/adwaita
lib/shim/xdg
lib/mesa/glesv2/dl
{{super()}}
{% endblock %}

{% block std_env %}
bld/wrapcc/dynlink/new
{{super()}}
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block configure %}
export LDFLAGS="-rdynamic ${LDFLAGS}"
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*No available application.*|return ix_xdg_open(path);|' \
    -e 's|.*Failed to get default app for MIME type.*|return ix_xdg_open(uri);|' \
    -i lib/ephy-file-helpers.c
{% endblock %}
