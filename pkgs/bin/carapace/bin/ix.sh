{% extends '//bin/carapace/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bin/carapace/generate
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/carapace
{% endblock %}

{% block build %}
carapace-generate
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp carapace ${out}/bin/
{% endblock %}
