{% extends '//bin/coreutils/9/0/ix.sh' %}

{% block version %}
9.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.gz
sha:6055df9268603e8239a5c9c1d64cb25b9a992530df66e33b8d78a660edb37b35
{% endblock %}
