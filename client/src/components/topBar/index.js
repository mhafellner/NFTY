import React from 'react';
import "./index.css";
import imgs from '../../assets/imgs/index'
import { withContext } from './../../provider/index';

export default withContext(() => {

  return (
    <header className="flex-container top-bar">
      <a href="/">
        <h1>NFTY</h1>
        {/* <img className="multisend-logo" src={imgs.nfty} alt="logo" /> */}
      </a>
      <ul>
        <li>
          <a href="#about">ABOUT</a>
        </li>
        <li>
          <a href="#contact">CONTACT</a>
        </li>
        <li>
          <a href="#help">FAQ</a>
        </li>
      </ul>
    </header>
  );
}
)