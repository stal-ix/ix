{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iperf
{% endblock %}

{% block version %}
3.22.1
{% endblock %}

{% block fetch %}
https://github.com/esnet/iperf/archive/refs/tags/{{self.version().strip()}}.tar.gz
3551bec8ccd166f90404809dd962a62549fada39d98425921887ee13f0ed201c
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block patch %}
{{super()}}
# musl gives pthreads a tiny default stack (~80 KB); iperf3's
# per-stream worker overflows it and the server quietly dies when
# the client opens its first data socket. Force a 1 MB stack on
# every pthread_attr that fronts a worker pthread_create.
sed -i 's|if (pthread_create(&(sp->thr), &attr,|pthread_attr_setstacksize(\&attr, 1 << 20); if (pthread_create(\&(sp->thr), \&attr,|' src/iperf_server_api.c src/iperf_client_api.c
{% endblock %}
