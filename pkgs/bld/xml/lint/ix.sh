{% extends '//lib/xml/2/t/ix.sh' %}

{% block pkg_name %}
libxml2
{% endblock %}

{% block version %}
2.11.7
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v{{self.version().strip()}}/libxml2-v{{self.version().strip()}}.tar.bz2
sha:65cbb82a24e7e8d821f279c77d7b3c69ea24fe8e29c4900744fc938a228990ab
{% endblock %}
