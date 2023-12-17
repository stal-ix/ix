{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/shim/fake(lib_name=ssl)
lib/shim/fake(lib_name=crypto)
lib/shim/fake/pkg(pkg_name=openssl,pkg_ver=1.1.1)
{% endblock %}
