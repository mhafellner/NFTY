import React from "react";
import "./index.css";
import icons from "./../../assets/icons/index";
import imgs from './../../assets/imgs/index';
import { RightBars, LeftBars } from './bars';
import Button from '../ButtonWithRouter';
import { withContext } from "./../../provider/index";

export default withContext(({ ctx }) => (
  <section className="flex-container intro">
    <div>
      <h2>
        Create a Vault <br />
        Send {" "}
        <span className="ms-green">TOKEN</span>
        <br />Get Rewarded
      </h2>
      <p>
        We bring the concept of securitization from traditional
        finance to the blockchain and allow to form portfolios
        of NFTs that regularly distribute the earned cashflows
        from the NFTs to the holders of the tokens representing
        ownership in the NFT vault.
      </p>
      {
        ctx.auth ? (
          <Button to="/send" customStyle="ms-btn wt-icon ms-green-bg">
            START SENDING <span className="send-arrow">↗</span>
          </Button>
        ) : (
          <Button to="/connect" customStyle="ms-btn wt-icon ms-green-bg">
            START SENDING <span className="send-arrow">↗</span>
          </Button>
        )
      }
    </div>
    <div>
      <img src={imgs.miniMultisend} alt="mini-multisend" />
    </div>
    <div>
      <h4>Contact us through email</h4>
      <div>
        <div>
          <input placeholder="Email address... " />
          <button className="ms-btn wt-icon ms-green-bg">
            <img src={icons.rightArrow} alt="icon" />
          </button>
        </div>
      </div>
    </div>
    <RightBars />
    <LeftBars />
  </section>
));
