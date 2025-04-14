{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
mawk
{% endblock %}

{% block version %}
1.3.4-20230203
{% endblock %}

{% block fetch %}
https://invisible-mirror.net/archives/mawk/mawk-{{self.version().strip()}}.tgz
sha:6db7a32ac79c51107ad31a407d4f92c6b842dde2f68a7533b4e7b7b03e8900be
{% endblock %}
