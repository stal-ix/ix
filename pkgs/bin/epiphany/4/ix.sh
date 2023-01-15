{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/daf27838bb441b715a341ccdcb2b18dcc3aec77f.zip
sha:96b4471b912644940b97554666573b5e5547ae9a0b19bbcc591fe7dfb046eaa1
{% endblock %}

{% block bld_libs %}
lib/adwaita
lib/mesa/glesv2/dl
{{super()}}
{% endblock %}
