{% extends 't/ix.sh' %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.12.18.tar.xz
sha:beb902a5f69d9e57710112203db38111dad6d30556ea8ce389284c8077fe944d
{% endblock %}

{% block host_libs %}
lib/musl/pure(std_env={{std_env}},std_box={{std_box}},boot={{boot}})
{% endblock %}
