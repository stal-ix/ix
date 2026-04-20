{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/13.tar.gz
{% endblock %}

{% block go_sha %}
eca37af736ba7c311622e289065cd88c7ccbd63986deaf68039d17cc9c55678b
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
