{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/magiblot/tvision
{% endblock %}

{% block git_commit %}
0decd5baf3700df39fecef5d3c450c92dda3b216
{% endblock %}

{% block git_sha %}
02700d4b2327d73e9be4a9222a5580f57ff9ab7e7a57195ef94db0c767124795
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/kernel
lib/curses
{% endblock %}
