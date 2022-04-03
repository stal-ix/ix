{% extends '//mix/proxy.sh' %}

{% block env_lib %}
dl_stubs() (
    python3 "\$(which gen_dl_stubs_1.py)" \${1} {{target.os}}
)

dl_stubs_3() (
    python3 "\$(which gen_dl_stubs_3.py)"
)
{% endblock %}
