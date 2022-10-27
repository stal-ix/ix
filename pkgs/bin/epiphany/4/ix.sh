{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/2340606e6c2ac65e9b73e57e9a277b86a1f6bc1d.zip
sha:683657e9ee2bdaa115eaf7b23de26444d1e6809c55a831813ffdee91439e0846
{% endblock %}

{% block bld_libs %}
lib/adwaita
{{super()}}
{% endblock %}
