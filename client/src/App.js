import React, { Component } from 'react';
import logo from './Green.jpg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <h1 className="App-title">Hello K8S!</h1>
            <Link to="/">Home</Link>
            <Link to="/OtherPage">Other Page</Link>
          </header>
          <div>
            <Route exact path="/" component={Fib} />
            <Route path="/OtherPage" component={OtherPage} />
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
