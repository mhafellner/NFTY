import React from 'react';
import "./index.css";
import Button from "..//ButtonWithRouter";
import { withContext } from './../../provider/index';

export default withContext(({ ctx, beta }) => {

  const BetaImg = beta ? <img className="beta-icon" src={beta} alt="beta" /> : null


  const show = () => {
    if (ctx.network === "main") {
      return <Button customStyle="ms-btn wt-icon  livenet">
        {ctx.network} net
      </Button>
    } else {
      return <Button customStyle="ms-btn wt-icon  testnet">
        {ctx.network}
      </Button>
    }
  }


  return (
    <header className="flex-container top-bar">
      <a href="/">
        <h1>NFTY</h1>
        {/* <img className="multisend-logo" src={imgs.multisendWithIcon} alt="logo" /> */}
        {BetaImg}
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