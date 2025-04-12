{% extends '//die/fonts.sh' %}

{% block version %}
24.8.1
{% endblock %}

{% block fetch %}
https://github.com/notofonts/notofonts.github.io/archive/refs/tags/noto-monthly-release-{{self.version().strip()}}.tar.gz
sha:84d292fc934ad6a9f20705fdfa5764b81b456b0e733f98b6f44388fb8c8eb44a
{% endblock %}

{% block skip_ttf %}
{% endblock %}
