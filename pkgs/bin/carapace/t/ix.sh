{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/carapace-sh/carapace-bin/archive/refs/tags/v1.1.1.tar.gz
{% endblock %}

{% block go_sha %}
1cec5bab33ebb03fdec33f400776243b5a2fb0213321a35359dd3044c1c832bf
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
