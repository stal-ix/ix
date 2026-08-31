{% extends '//lib/wlroots/19/ix.sh' %}

{% block pkg_name %}
wlroots
{% endblock %}

{% block version %}
0.20.2
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/{{self.version().strip()}}/wlroots-{{self.version().strip()}}.tar.bz2
20c37b521dc3054b6e9627b79bdd45fc716db9ebc58bdf97e57e84d04b04610f
{% endblock %}
