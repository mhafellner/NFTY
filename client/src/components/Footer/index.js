import React from 'react';
import './index.css'
// import { Link } from 'react-router-dom'

export default () => (
    <footer id="contact" className="flex-container footer">
        <div><div>© NFTY</div></div>
        {/* <div><Link to="/donate">Donate</Link></div> */}
        <ul>
            {/* <li><a target="_blank" rel="noopener noreferrer" href="#">Telegram</a></li> */}
            {/* <li><a target="_blank" rel="noopener noreferrer" href="#">Etherscan</a></li> */}
            <li><a target="_blank" rel="noopener noreferrer" href="https://github.com/mhafellner/NFTY/tree/master/client">Github</a></li>
        </ul>
    </footer>
)