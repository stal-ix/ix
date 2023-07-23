{% extends '//die/c/ix.sh' %}

{% block git_repo %}
https://github.com/webview/webview
{% endblock %}

{% block git_commit %}
5f6562f358d9f50df7fef2214e3e0ee8de87d5dc
{% endblock %}

{% block git_sha %}
921220b5fe49637a1e15b3104b03b030e9c804594f63474a69b560024e3bfe60
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
