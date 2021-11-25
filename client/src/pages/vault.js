import React from "react";
import TopBar from "../components/topBar";
import Vault from '../components/vaultSection/index'
import Footer from "../components/Footer"

export default () => (
    <main className="vault">
        <TopBar />
        <Vault />
        <Footer />
    </main>
);
