{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
#https://github.com/GNOME/epiphany/archive/daf27838bb441b715a341ccdcb2b18dcc3aec77f.zip
#sha:96b4471b912644940b97554666573b5e5547ae9a0b19bbcc591fe7dfb046eaa1
#https://github.com/GNOME/epiphany/archive/7d26b5a0c6d743c53834cd9c210038df75ad850b.tar.gz
#sem:633bc8c515ba8c2d007f06303591c6e73324d58cee18f6e23a9a0749a1dbe021
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
