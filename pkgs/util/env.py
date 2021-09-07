DATA = '''
import os
with open(os.environ['out'] + '/env', 'w') as f:
        f.write("""{% block env %}{% endblock %}""")
'''

def package(mix):
    return {
        'build': {
            'script': {
                'data': DATA,
                'kind': 'py',
            },
        },
    }
