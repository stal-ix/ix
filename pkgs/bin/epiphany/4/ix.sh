{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/0f02b2f921d89513abf659e6a2117f07bdac53cf.zip
sha:615eed6f34193628e4bbebd44761a81d9ba22945584b9c4ea6d29611c7ae086f
{% endblock %}

{% block bld_libs %}
lib/adwaita
lib/mesa/glesv2/dl
{{super()}}
{% endblock %}
