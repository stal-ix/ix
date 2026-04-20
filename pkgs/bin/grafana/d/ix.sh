{% extends '//bin/grafana/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd pkg/cmd/grafana
{% endblock %}

{% block go_bins %}
grafana
{% endblock %}

# Grafana compiles hundreds of packages; with the default -p=make_thrs
# (88 on lab1) each compile worker holds its own heap and the box OOMs
# before link. Cap parallelism at 4 — slow but fits in 28 GiB RAM.
# GOGC=25 cranks the GC harder to trim transient heap spikes.
{% block go_build_flags %}
{{super()}}
-p 4
{% endblock %}

{% block step_setup %}
{{super()}}
export GOGC=25
{% endblock %}
