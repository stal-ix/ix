{% extends '//lib/wlroots/17/ix.sh' %}

{% block pkg_name %}
wlroots
{% endblock %}

{% block version %}
0.19.3
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/{{self.version().strip()}}/wlroots-{{self.version().strip()}}.tar.bz2
195b8be12ed3f39c09258cdac11705c6d2660db8f516a5e98e6c2cb3482b02cd
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/lift/off
{% endblock %}
