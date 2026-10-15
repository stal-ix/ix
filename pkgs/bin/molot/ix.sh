{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/44.tar.gz
{% endblock %}

{% block go_sha %}
106ddc3fc644ab7d13fd587872e7c0667844758870f5efd2839418e13f3d9c37
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
