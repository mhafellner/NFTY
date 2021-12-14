import React from "react";
import Button from '../ButtonWithRouter'

export default () => (
    <main className="send">
        <div>
            <h1>VAULT</h1>
            <Button to="/vault" customStyle="ms-btn wt-icon ms-green-bg">
                Buy
            </Button>
            <Button to="/vault" customStyle="ms-btn wt-icon ms-green-bg">
                Redeem
            </Button>
            <Button to="/vault" customStyle="ms-btn wt-icon ms-green-bg">
                price
            </Button>
            <Button to="/connect" customStyle="ms-btn wt-icon ms-green-bg">
                connect wallet <span className="send-arrow">↗</span>
            </Button>

        </div>
    </main>
);
