{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/byacc/byacc-20221106.tgz
sha:a899be227bbcac9cf7700f7dbb5a8494688f1f9f0617b510762daeace47b9d12
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
