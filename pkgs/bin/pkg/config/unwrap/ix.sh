{% extends '//bin/pkg/config/ix.sh' %}

{% block install %}
{{super()}}
mv ${out}/bin/pkg-config ${out}/bin/pkg-config-bin
{% endblock %}

{% block env %}
export PKG_PROG_PKG_CONFIG="${out}/share/aclocal/pkg.m4"
{% endblock %}
