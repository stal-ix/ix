{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/epiphany/-/archive/43.0/epiphany-43.0.tar.bz2
sha:867117c09a532c06e2db0f283c153f310bfec0e28c4ef06955dfa1f3ec6167c7
{% endblock %}

{% block bld_libs %}
lib/handy
lib/dazzle
{{super()}}
{% endblock %}
