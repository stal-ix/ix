{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/build/cpu
lib/build/opt
lib/build/type
lib/build/sanitize
{% if cflags %}
lib/build/flag(flag=CFLAGS,flags={{cflags}})
{% endif %}
{% if cxxflags %}
lib/build/flag(flag=CXXFLAGS,flags={{cxxflags}})
{% endif %}
{% if cppflags %}
lib/build/flag(flag=CPPFLAGS,flags={{cppflags}})
{% endif %}
{% if ldflags %}
lib/build/flag(flag=LDFLAGS,flags={{ldflags}})
{% endif %}
{% endblock %}
