{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/nss/unwrap
lib/shim/fake/pkg(pkg_name=nss,pkg_ver=3.96)
{% endblock %}
