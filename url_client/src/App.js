import React from 'react';
import './App.css';

export default class App extends React.Component {
  constructor(){
    super()

    this.state = {
      long_url: '',
      urlData: []
    }

    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleChange = this.handleChange.bind(this)
  }

  handleSubmit (event) {
    // here we are fetching from the rails server to the create method to send it the url form data
    event.preventDefault();
    const url = "http://localhost:3000/api/v1/converts/create";
    const { long_url } = this.state;

    if (long_url.length === 0)
      return;

    const body = {
      long_url
    };
    
    // const token = document.querySelector('meta[name="csrf-token"]').content;
    fetch(url, {
      method: "POST",
      headers: {
        // "X-CSRF-Token": token,
        "Content-Type": "application/json"
      },
      body: JSON.stringify(body)
    })
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Something went wrong generating new url");
      })
      .then(response => this.setState({ urlData: response}))
      .catch(error => console.log(error.message));
  };

  handleChange(event) {
    this.setState({
      long_url: event.target.value
    });
  }

  render(){
    return (
      <div className="url-container">
        <h1 style={{
          color: 'white', 
          textAlign: 'center', 
          paddingTop: '15%'
          }}
        >
          Lengthy URL? Shorten'it with Stordy
        </h1>
        <div className="url-form-box">
          <form 
          onSubmit={this.handleSubmit} 
          style={{padding: '10px'}}
          >
            <label style={{padding: '5px'}}>
              URL:
              <input 
              placeholder="Paste URL here" 
              value={this.state.long_url} 
              onChange={this.handleChange} 
              style={{width: '80%'}} 
              type="text" 
              />
            </label>
            <input id="convert-button" type="submit" value="Convert" />
          </form>
        </div>
        
        <div className="url-response-box">
          <input
          disabled
          id="new-url"
          style={{width: '80%'}}
          value={this.state.urlData.new_url}
          />
        </div>
      </div>
    );
  }
}