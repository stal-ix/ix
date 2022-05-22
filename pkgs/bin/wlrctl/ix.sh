{% extends '//die/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~brocellous/wlrctl/archive/v0.2.1.tar.gz
sha:de8848de0a81749fe7ee7316bead0261bd978e26c2f899d02897609972a6e98c
{% endblock %}

{% block bld_libs %}
lib/c
lib/wlroots
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}
