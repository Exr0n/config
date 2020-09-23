import { React } from 'uebersicht';

import StatusList from './src/components/StatusList.jsx';
import Error from './src/components/Error.jsx';

const config = {};

export const refreshFrequency = 5000;
export const command = 'zsh git_status.widget/get_git_status.zsh 10';

export const render = ({output, error}) => {
    return error ? <Error error={error} /> : <StatusList out={output} config={config} />
}

