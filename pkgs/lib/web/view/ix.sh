{% extends '//die/c/ix.sh' %}

{% block git_repo %}
https://github.com/webview/webview
{% endblock %}

{% block git_commit %}
5f6562f358d9f50df7fef2214e3e0ee8de87d5dc
{% endblock %}

{% block git_sha %}
5a2d83648c012b0fcdcf2a39e2b9ead5051f5374bf1f54b09bd3d57bb2836690
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/gtk
lib/web/kit/gtk
{% endblock %}

{% block build %}
c++ -c webview.cc
ar q libwebview.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.a ${out}/lib/
cp *.h ${out}/include/
{% endblock %}

{% block git_version %}
v3
{% endblock %}
