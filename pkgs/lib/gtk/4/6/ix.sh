{% extends '//lib/gtk/4/4/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.6.5/gtk-4.6.5.tar.bz2
sha:e817a748c8390146c831c7d64a2bd6979db71af34029e3bd93a1182f12678dda
{% endblock %}

{% block bld_tool %}
bin/sassc
{{super()}}
{% endblock %}
