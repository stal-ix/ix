{% block version %}
1.0.8
{% endblock %}

{% block pkg_name %}
sched-ext
{% endblock %}

{% block source_url %}
https://github.com/sched-ext/scx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}
