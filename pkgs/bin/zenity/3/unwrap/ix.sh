{% extends '//bin/zenity/t/ix.sh' %}

{% block version %}
3.44.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/zenity/-/archive/{{self.version().strip()}}/zenity-{{self.version().strip()}}.tar.bz2
sha:3dd4a79abd3e1e9589abc785b333891d10ae6ba99134eb60e266d29b38a2c90b
{% endblock %}
