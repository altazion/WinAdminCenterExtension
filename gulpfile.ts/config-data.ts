
import { Config } from './common/config';

function gulpConfig(): Config {
    return {
        resjson: {
            resourceName: 'AltazionAltazionapps',
            localeOffset: 0,
            localePath: 'loc'
        },
        powershell: {
            name: 'altazion.altazion-apps',
            guid: '536c3c34-a5a3-40a4-b76c-5c90e63b9f4e',
            list: [
                'src',
                'node_modules/@microsoft/windows-admin-center-sdk'
            ],
            enablePester: false,
            skipCim: true
        },
        test: {
            skip: true
        }
    };
}

exports.gulpConfig = gulpConfig;
