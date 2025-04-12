{% extends '//lib/placebo/6/ix.sh' %}

{% block version %}
7.349.0
{% endblock %}

{% block fetch %}
https://code.videolan.org/videolan/libplacebo/-/archive/v{{self.version().strip()}}/libplacebo-v{{self.version().strip()}}.tar.bz2
sha:38c9c75d9c1bb412baf34845d1ca58c41a9804d1d0798091d7a8602a0d7c9aa6
{% endblock %}
