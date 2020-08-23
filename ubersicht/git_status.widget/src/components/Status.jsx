import { React } from 'uebersicht';


class Status extends React.Component {
    constructor(props) {
        super(props);
    }
    render() {
        const is_clean = !this.props.out[1] && !this.props.out[2] && !this.props.out[3];
        const check = 'status-icon status-icon-clean icon icon-check' + (is_clean ? '':' status-hide');
        return <div className="status">
            <div className="status-icons">
                <div className={'status-icon-clean icon-check' + (is_clean ? '' : ' status-hide')} />
                <div className={'status-icon-staged icon-pscircle' + (this.props.out[3]>0 ? '':' status-hide')}>
                    <div className="status-icon-count">{this.props.out[3]}</div>
                </div>
                <div className={'status-icon-modified icon-plus-sign' + (this.props.out[2]>0 ? '':' status-hide')}>
                    <div className="status-icon-count">{this.props.out[2]}</div>
                </div>
                <div className={'status-icon-untracked icon-question-sign' + (this.props.out[1]>0 ? '':' status-hide')}>
                    <div className="status-icon-count">{this.props.out[1]}</div>
                </div>
                <div className={'status-icon-untracked icon-question-sign status-hide'}></div>
            </div>
            <div className="status-path">
                {this.props.out[0].split('/').pop()}
            </div>
        </div>
    }
}

export default Status;

