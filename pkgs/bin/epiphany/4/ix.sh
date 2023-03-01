{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/refs/tags/44.beta.tar.gz
sha:571dd35cde4ce75eb8ff629c38290b2caef0172cbee77f7f993a78a8aef0360f
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
