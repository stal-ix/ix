{% extends '//bin/zenity/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/zenity/-/archive/4.0.2/zenity-4.0.2.tar.bz2
sha:183df6499752c7b29e44c56248a796a91ed20c3d0eb8d719b72746be01cf7d43
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/adwaita
{% endblock %}

{% block bld_tool %}
bld/help2man
{{super()}}
{% endblock %}
