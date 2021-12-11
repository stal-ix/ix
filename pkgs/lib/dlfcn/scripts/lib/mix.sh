{% extends '//mix/template/proxy.sh' %}

{% block env %}
dl_stubs() {
    python3 "\$(which gen_dl_stubs.py)" \$1 {{target.os}}
}
{% endblock %}
