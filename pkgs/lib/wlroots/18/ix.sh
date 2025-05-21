{% extends '//lib/wlroots/17/ix.sh' %}

{% block pkg_name %}
wlroots
{% endblock %}

{% block version %}
0.19.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/{{self.version().strip()}}/wlroots-{{self.version().strip()}}.tar.bz2
sha:2f31ba9d4ae1ff3f5ac62f21b046fe31bb408c7f887c4dfafb2e09e98c991980
{% endblock %}
