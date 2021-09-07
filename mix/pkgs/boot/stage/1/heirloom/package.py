def package(mix):
    return {
        'build': {
            'script': mix.files.build_py,
            'fetch': [
                {
                    'url': 'https://github.com/pg83/heirloom/archive/a47c4acf9fb43b89f9fb0afdcf9008121d50d806.zip',
                    'md5': '19b59804cf21bf9bd266d9cb261ecb2c',
                },
            ],
            'depends': [
                'boot/stage/1/bmake',
                'boot/stage/0/env',
            ],
        },
    }
