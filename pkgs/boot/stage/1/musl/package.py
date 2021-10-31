def package(mix):
    return {
        'build': {
            'script': mix.files.build_py,
            'fetch': [
                {
                    'url': 'https://musl.libc.org/releases/musl-1.2.2.tar.gz',
                    'md5': 'aed8ae9e2b0898151b36a204088292dd',
                },
            ],
            'depends': [
                'boot/stage/0/env/package.py',
            ],
        },
    }
