{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/1824d11debb401be0f797a1323bbc803336144a2.tar.gz
sem:53c2dec7c5633ae4feb8486ed649a5e2036171dd4d15a92de8f8defd881b33d6
{% endblock %}

{% block bld_libs %}
lib/adwaita
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
