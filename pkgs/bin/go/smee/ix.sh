{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gosmee
{% endblock %}

{% block version %}
0.29.0
{% endblock %}

{% block go_url %}
https://github.com/chmouel/gosmee/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
45286a81a45e61e06125e5eb1511753c5bda6eb383ae277a1341acff1059449c
{% endblock %}

{% block go_bins %}
gosmee.bin
{% endblock %}

{% block go_build_flags %}
-o gosmee.bin
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
