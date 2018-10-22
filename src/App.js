import React, { Component } from 'react';
import './App.css';
import NavBar from './NavBar';
import AddressForm from './AddressForm';

class App extends Component {
  render() {
    return (
      <div>
        <NavBar /> <br></br>
        <AddressForm />
      </div>
    );
  }
}

export default App;
