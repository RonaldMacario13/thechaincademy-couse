import React, { useState } from 'react';

const MyButton = () => {
  const [connectedAccount, setConnectedAccount] = useState(null);

  const connectMetamask = async () => {
    try {
      if (window.ethereum && window.ethereum.isMetaMask) {
        const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
        setConnectedAccount(accounts[0]);
      } else {
        alert('Metamask is not installed or not enabled.');
      }
    } catch (error) {
      console.error('Error connecting to Metamask:', error);
    }
  };

  return (
    <div>
      <button id="connectButton" className="connectButton" onClick={connectMetamask}>
        Connect to Metamask
      </button>
      {connectedAccount && (
        <p id="accounts">{connectedAccount}</p>
      )}
    </div>
  );
};

export default MyButton;
