import { React } from 'uebersicht';

import Status from './Status.jsx';

class StatusList extends React.Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (
        <div className="status-list">
            <link rel="stylesheet" type="text/css" href="git_status.widget/index.css"/>
            <link rel="stylesheet" type="text/css" href="git_status.widget/whhg-font/css/whhg.css"/>
            {this.props.out.trim().split('\n').map(p => <Status out={JSON.parse(p)} />)}
        </div>
        );
    }
}

export default StatusList;

