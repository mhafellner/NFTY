import React from 'react';
import "./index.css";
import { withContext } from './../../provider/index';

export default withContext(({ ctx, beta }) => {

  return (
    <header className="flex-container top-bar">
      <a href="/">
        <h1>NFTY</h1>
      </a>
      <ul>
        <li>
          <a href="/">ABOUT</a>
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