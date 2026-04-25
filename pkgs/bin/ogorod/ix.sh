{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/ogorod/archive/ed0838cf0caeb048782c9a81ad4b998992cf5039.tar.gz
{% endblock %}

{% block go_sha %}
b982f29785a79d71ae3add5abe52de5b8c5386c61276088cbf56f7ca5249b10a
{% endblock %}

{% block go_bins %}
ogorod
{% endblock %}
