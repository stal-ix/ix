{% extends '//bin/go/lang/20/ix.sh' %}

{% block version %}
1.13.14
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
sha:5f8fd27d469026b05c46001b9553c8681614c5e8cfbce81e82ce28e7a17567a6
{% endblock %}
