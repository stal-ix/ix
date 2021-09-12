def package(mix):
    return {
        'build': {
            'script': mix.files.build_py,
            'fetch': [
                {
                    'url': 'https://github.com/pg83/shutil/archive/23f679883ebe41fe225f44202bb9ebd49db9a162.zip',
                    'md5': '956db4f88a97fc1582f6b324ed5686cc',
                },
            ],
            'depends': [
                'boot/stage/1/env',
            ],
        },
    }
