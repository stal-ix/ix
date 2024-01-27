{% extends 't/ix.sh' %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.18.14.tar.xz
sha:e17d46451133d3a3099b09e200839e875100b48403171923ab71b6a9b39856af
{% endblock %}

{% block host_libs %}
# need proper flag inheritance
lib/musl/pure(std_env={{std_env}},std_box={{std_box}})
{% endblock %}
