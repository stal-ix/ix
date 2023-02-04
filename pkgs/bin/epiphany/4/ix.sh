{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
#https://github.com/GNOME/epiphany/archive/daf27838bb441b715a341ccdcb2b18dcc3aec77f.zip
#sha:96b4471b912644940b97554666573b5e5547ae9a0b19bbcc591fe7dfb046eaa1
https://github.com/GNOME/epiphany/archive/7d26b5a0c6d743c53834cd9c210038df75ad850b.tar.gz
sem:633bc8c515ba8c2d007f06303591c6e73324d58cee18f6e23a9a0749a1dbe021
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
