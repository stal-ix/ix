{% extends '//lib/gcr/t/ix.sh' %}

{% block pkg_name %}
gcr
{% endblock %}

{% block version %}
3.41.2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/{{self.version().strip()}}/gcr-{{self.version().strip()}}.tar.bz2
7247cc8939fa0e24be5f74b99f1c355ecddd2276d3677fb25f13cf2f58d9e6d3
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/3
{% endblock %}
