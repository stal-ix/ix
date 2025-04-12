{% extends '//bin/make/ix.sh' %}

{% block version %}
4.3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/make/make-{{self.version().strip()}}.tar.gz
sha:e05fdde47c5f7ca45cb697e973894ff4f5d79e13b750ed57d7b66d8defc78e19
{% endblock %}
