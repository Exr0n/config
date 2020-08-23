import { React } from 'uebersicht';

class StatusList extends React.Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (
        <div className="status-list">
            <link rel="stylesheet" type="text/css" href="git_status.widget/index.css"/>
            <link rel="stylesheet" type="text/css" href="git_status.widget/whhg-font/css/whhg.css"/>
            {
                this.props.out
                    .trim()
                    .split('\n')
                    .map(p => { try { return JSON.parse(p) } catch (e) { return undefined; } } )
                    .map(p => {
                        if (p) {
                            const is_clean = !p[2] && !p[3] && !p[4];
                            return <div className="status">
                                <div className="status-icons">
                                    <div className={is_clean ? 'status-icon-clean icon-check' : 'status-icon-dirty icon-chevron-right'} />
                                    <div className={'status-icon-staged icon-pscircle' + (p[4]>0 ? '':' status-hide')}>
                                        <div className="status-icon-count">{p[4]}</div>
                                    </div>
                                    <div className={'status-icon-modified icon-plus-sign' + (p[3]>0 ? '':' status-hide')}>
                                        <div className="status-icon-count">{p[3]}</div>
                                    </div>
                                    <div className={'status-icon-untracked icon-question-sign' + (p[2]>0 ? '':' status-hide')}>
                                        <div className="status-icon-count">{p[2]}</div>
                                    </div>
                                </div>
                                <div className="status-path">
                                    {p[1].split('/').pop()}
                                </div>
                                <div className="status-branch">
                                    {p[0]}
                                </div>
                            </div>
                        } else {
                            return <div className="status-path">Loading...</div>
                        }
                    })
            }
            <div id="bottom-spacer" />
        </div>
        );
    }
}

export default StatusList;

