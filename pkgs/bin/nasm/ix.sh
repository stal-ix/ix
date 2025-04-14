{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
nasm
{% endblock %}

{% block version %}
2.16.01
{% endblock %}

{% block fetch %}
{% if std_box or std_env %}
https://www.nasm.us/pub/nasm/releasebuilds/{{self.version().strip()}}/nasm-{{self.version().strip()}}.tar.gz
sha:d833bf0f5716e89dbcd345b7f545f25fe348c6e2ef16dbc293e1027bcd22d881
{% else %}
https://www.nasm.us/pub/nasm/releasebuilds/2.16.03/nasm-2.16.03.tar.gz
sha:5bc940dd8a4245686976a8f7e96ba9340a0915f2d5b88356874890e207bdb581
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
